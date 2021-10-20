json.order do
    json.extract! @order, :tickets_amount, :expiration_time, :created_at, :event_id, :status, :order_value
  end
