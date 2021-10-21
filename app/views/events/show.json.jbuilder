# frozen_string_literal: true

json.event do
  json.extract! @event, :id, :name, :formatted_time, :tickets_total, :tickets_sold, :start_date, :tickets_price
end
