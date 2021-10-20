# frozen_string_literal: true

class OrdersController < ApiController
  before_action :set_order, only: %i(show pay)

  def index
    @orders = Order.all
  end

  def show

  end

  def pay

  end


  private

  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    not_found_error(error)
  end
end
  