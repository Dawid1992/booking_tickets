# frozen_string_literal: true

json.orders do
    json.array! @orders, :id, :tickets_amount, :expiration_time, :status
  end
  