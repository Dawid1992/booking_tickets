# frozen_string_literal: true

class OrdersController < ApiController
  rescue_from TicketPayment::ClosedOrder, with: :closed_order_error
  rescue_from Payment::Gateway::CardError, Payment::Gateway::PaymentError,
              with: :payment_failed_error
  before_action :set_order, only: %i(show)
  before_action :set_event

  def index
    @orders = @event.orders
  end

  def show

  end

  def pay
    @order = Order.find(params[:order_id])
    payment_token = params[:token]
    tickets_count = @order.tickets_amount.to_i
    
    if @order.expiration_time < Time.now()
      @order.destroy!
      render json: { error: "The time limit of 15 minutes to pay for this reservation has passed. Order has been cancelled" }
    end

    TicketPayment.call(@order, payment_token, tickets_count)
    render json: { success: 'Payment succeeded.' }
  end


  private

  def set_order
    @order = Order.find(params[:order_id])
  rescue ActiveRecord::RecordNotFound => error
    not_found_error(error)
  end

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    not_found_error(error)
  end

  def after_expiration_time
    render json: { error: "The time limit of 15 minutes to pay for this reservation has passed. Order has been cancelled" }, status: :unprocessable_entity
  end

  def payment_failed_error(error)
    render json: { error: error.message }, status: :payment_required
  end

  def closed_order_error(error)
    render json: { error: error.message }
  end
end
  