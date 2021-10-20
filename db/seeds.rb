10.times do
  e = Event.create!(name: Faker::FunnyName.four_word_name, time: Faker::Time.forward, tickets_total:100,tickets_price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
  Ticket.create!(event: e)
end
