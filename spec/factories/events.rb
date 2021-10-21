# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::FunnyName.four_word_name }
    time { Faker::Time.forward }
    tickets_total {Faker::Number.between(from: 50, to: 100)}
    tickets_price {Faker::Number.decimal(l_digits: 2, r_digits: 2)}
    start_date {Faker::Date.forward}

    trait :with_order do
      after(:create) do |event|
        FactoryBot.create(:order, event: event)
      end
    end
  end
end
