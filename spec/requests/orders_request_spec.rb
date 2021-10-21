# frozen_string_literal: true

RSpec.describe "Orders", type: :request do
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

  describe "GET order#index" do
    context "event exists" do
      subject { get "/events/#{event.id}/orders", params: params }

      let(:params) { { event_id: event.id } }

      before { subject }

      context "order exists" do
        let(:event) { create(:event, :with_order) }
        let(:order) { event.order }

        it "should have correct HTTP status" do
          expect(response).to have_http_status(:ok)
        end

        it "should have correct size" do
          expect(response_json.size).to eq(1)
        end

      end
    end

  end

  describe "POST orders#pay" do
    let(:valid_params) { { token: 'ok'} }
    let(:card_error) { { token: 'card_error'} }
    let(:payment_error) { { token: 'payment_error'} }
    context "event exists" do
      let(:event){Event.first}
      let(:order){event.orders.first}

      it "valid params" do
        post "/events/#{event.id}/orders/#{order.id}/pay",params: valid_params
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response_json).to eq({ success: 'Payment succeeded.' })
      end

      context 'card error' do
        it 'should render success message' do
          post "/events/#{event.id}/orders/#{order.id}/pay",params: card_error
          expect(response.content_type).to eq('application/json; charset=utf-8')
          expect(response).to have_http_status(402)
          expect(response_json).to eq({ error: 'Your card has been declined.' })
        end
      end
      
      context 'payment error' do
        it 'should render success message' do
          post "/events/#{event.id}/orders/#{order.id}/pay",params: payment_error
          expect(response.content_type).to eq('application/json; charset=utf-8')
          expect(response).to have_http_status(402)
          expect(response_json).to eq({ error: 'Something went wrong with your transaction.' })
        end
      end

      context "pay if order is already close" do
        before do
          order.status = 'closed'
          order.save
        end
        it "respond with error" do
          post "/events/#{event.id}/orders/#{order.id}/pay",params: valid_params
          expect(response_json[:error]).to match("This order is now closed. You cannot pay for it again")
        end
      end
    end
  end
end

def response_json
  JSON.parse(response.body).deep_symbolize_keys
end
