# frozen_string_literal: true

class TicketsController < ApiController
  before_action :set_event
  before_action :set_order

  def index
    @tickets = @order.tickets
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  rescue ActiveRecord::RecordNotFound => error
    not_found_error(error)
  end

  def set_order
    @order = Order.find(params[:order_id])
  rescue ActiveRecord::RecordNotFound => error
    not_found_error(error)
  end
end
