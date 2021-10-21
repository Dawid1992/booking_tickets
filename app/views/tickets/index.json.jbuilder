# frozen_string_literal: true

json.tickets do
  json.array! @tickets, :id, :unique_key, :order_id
end
