# frozen_string_literal: true

class EventsController < ApiController
  rescue_from ReserveService::NotEnoughTicketsError, with: :not_found_error
  rescue_from ReserveService::EventHasBegunError, with: :event_start_error
  before_action :set_event, only: %i(show book)

  def index
    @events = Event.all
  end

  def show
    render :show
  end

  def book
    ReserveService.call(params[:tickets_amount].to_i,@event)
    render json: @event.to_json
  end

  private

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    not_found_error(error)
  end

  def not_found_error(error)
    render json: { error: error.message }, status: :not_found
  end
  def event_start_error(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end
end
