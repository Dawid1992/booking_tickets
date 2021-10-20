# frozen_string_literal: true

json.orders do
    json.array! @orders, :id, :amount, :expiration_time
  end
  