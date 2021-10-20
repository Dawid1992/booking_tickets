# frozen_string_literal: true

json.tickets do
  json.extract! @tickets, :event_id
  json.event do
    json.extract! @event, :id, :name, :formatted_time
  end
end
