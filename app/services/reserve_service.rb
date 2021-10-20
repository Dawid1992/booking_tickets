class ReserveService
    def self.call(tickets_amount,event)
        event.update(tickets_sold: event.tickets_sold + tickets_amount)
    end
end
