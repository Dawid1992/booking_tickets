# frozen_string_literal: true

RSpec.describe Order, type: :model do
    let(:order){FactoryBot.create(:order)}
    subject { order } 
    describe "validations" do
      it { is_expected.to validate_presence_of(:tickets_amount) }
      it { is_expected.to validate_numericality_of(:tickets_amount).is_greater_than(0) }
      it { is_expected.to validate_numericality_of(:order_value).is_greater_than(0) }
    end
  
    describe "calculate expiration time" do
        it "calculate and add expiration time do order" do
            expect(subject.expiration_time.to_i).to eq(Time.now.in(900).to_i)
        end
    end

    # describe "validate tickets" do
    #   it "validate new order by available tickets" do
    #     expect { order }.to change { Order.count }.by(1)
    #   end
    # end
  end
  