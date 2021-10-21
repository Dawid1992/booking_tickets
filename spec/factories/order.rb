# frozen_string_literal: true

FactoryBot.define do
    factory :order do
      association :event
      event_id {event.id}
      tickets_amount {10}
      order_value {event.tickets_total * self.tickets_amount}
    end
  end
  