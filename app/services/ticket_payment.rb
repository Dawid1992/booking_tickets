# frozen_string_literal: true

class TicketPayment
  ClosedOrder = Class.new(StandardError)

  def self.call(order, payment_token, tickets_count)
    raise ClosedOrder, 'This order is now closed. You cannot pay for it again' unless order.status == 'open'
    Payment::Gateway.charge(amount: order.order_value, token: payment_token)
    order.update(status:1)
  end
end
