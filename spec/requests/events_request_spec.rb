# frozen_string_literal: true

RSpec.describe "Events", type: :request do
  shared_examples "event not found" do
    it "should have correct HTTP status" do
      expect(response).to have_http_status(:not_found)
    end

    it "should render error" do
      expect(response_json).to eq({ error: "Couldn't find Event with 'id'=incorrect" })
    end
  end

  before do
    create_list(:event, 5, :with_order)
  end

  describe "GET events#index" do
    subject { get "/events" }

    before { subject }

    it "should have correct HTTP status" do
      expect(response).to have_http_status(:ok)
    end

    it "should render all events" do
      expect(response_json[:events].size).to eq(5)
    end
  end

  describe "GET events#show" do
    context "event exists" do
      subject { get "/events/#{event.id}" }

      let(:event) { Event.first }

      before { subject }

      it "should have correct HTTP status" do
        expect(response).to have_http_status(:ok)
      end

      it "should have correct size" do
        expect(response_json.size).to eq(1)
      end

      it "should render event" do
        expect(response_json).to include(
          event: hash_including(
            id: event.id,
            name: event.name,
            formatted_time: event.formatted_time
          )
        )
      end
    end

    context "event does not exist" do
      before { get "/events/incorrect" }
      it_behaves_like "event not found"
    end
  end

  describe "POST events#book" do
  let(:event){FactoryBot.create(:event)}
  let(:valid_params) { { tickets_amount: 10 } }
  let(:invalid_params) { { tickets_amount: event.tickets_total + 10 } }
    context "tickets form order are available" do
      it "responds with 200 status and valid amount of tickets" do
        post "/events/#{event.id}/book",params: valid_params
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response_json[:tickets_sold]).to eq(valid_params[:tickets_amount]) 
      end
    end
    context "book more tickets than available" do
      it "respond with error and status 404" do
        post "/events/#{event.id}/book",params: invalid_params
        expect(response).to have_http_status(404)
        expect(response_json[:error]).to match("Not enough tickets left.")
      end
    end

    context "book if event is already start" do
      before do
        event.start_date = Time.now.in(1000).to_i
        event.save
      end
      it "respond with error" do
        post "/events/#{event.id}/book",params: valid_params
        expect(response).to have_http_status(422)
        expect(response_json[:error]).to match("The event has already begun")
      end
    end
  end
end

def response_json
  JSON.parse(response.body).deep_symbolize_keys
end
