json.order do
    json.extract! @order, :amount, :expiration_time, :created_at
  end
