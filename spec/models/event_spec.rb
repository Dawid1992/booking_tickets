# frozen_string_literal: true

RSpec.describe Event, type: :model do
  describe "formatted_time" do
    let(:time) { DateTime.new(2020, 12, 31, 12) }
    let(:event) { create(:event, time: time) }

    it "displays correct date and time" do
      expect(event.formatted_time).to eq("31 December 2020, 12:00")
    end
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:tickets_total) }
    it { is_expected.to validate_numericality_of(:tickets_total).is_greater_than(0) }
  end

  describe "associations" do
    it { is_expected.to have_many(:orders) }
  end
end
