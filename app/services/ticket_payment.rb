# frozen_string_literal: true

class TicketPayment
  ClosedOrder = Class.new(StandardError)

  def self.call(order, payment_token, tickets_count)
    if order.status == 'open'
      Payment::Gateway.charge(amount: order.order_value, token: payment_token)
      order.update(status:1)
      order.tickets_amount do
        ticket = Ticket.create(order_id: order.id, unique_key: event.name.hash.to_s + SecureRandom.alphanumeric(3))
      end
    else
      raise ClosedOrder, 'This order is close'
    end
  end
end
