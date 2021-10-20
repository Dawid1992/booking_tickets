# frozen_string_literal: true

class EventsController < ApiController
  before_action :set_event, only: :show

  def index
    @events = Event.all
  end

  def show
    render :show
  end

  def book
    @event = Event.find(params[:id])
    if @event.time > Time.now()
      order = Order.new(event_id: @event.id, amount: params[:amount])
      if order.save
        render json: order.to_json
      else
        raise StandardError, "Something is wrong with Yours order"
      end
    else
      raise StandardError, "Event is already over"
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    not_found_error(error)
  end
end
