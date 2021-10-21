class ReserveService

    NotEnoughTicketsError = Class.new(StandardError)
    EventHasBegunError = Class.new(StandardError)
    
    def self.call(tickets_amount,event)

        available_tickets = event.tickets_total - event.tickets_sold
        raise NotEnoughTicketsError, 'Not enough tickets left.' unless available_tickets >= tickets_amount
        raise EventHasBegunError, 'The event has already begun' unless event.start_date.to_i > Time.now().to_i
        order = Order.new(event_id: event.id, tickets_amount: tickets_amount)
        event.update(tickets_sold: event.tickets_sold + tickets_amount)
    end
end
