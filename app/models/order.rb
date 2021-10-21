# frozen_string_literal: true
class Order < ApplicationRecord
    enum status: [ :open, :closed ]
    belongs_to :event
  
    validates_presence_of :event_id, :tickets_amount
    validates :tickets_amount, numericality: { greater_than: 0 }
    validates :order_value, numericality: { greater_than: 0 }
    before_save :add_expiration_time, :calculate_order_value
    after_destroy :return_unsold_tickets

    def add_expiration_time
      if self.expiration_time.nil?
        self.expiration_time = Time.now.in(900)
      end
    end

    def calculate_order_value
      if self.event_id
        event = Event.find(self.event_id)
        order_value = self.tickets_amount * event.tickets_price
        self.order_value = order_value
      end
    end

    def return_unsold_tickets
      event = Event.find(self.event_id)
      event.tickets_sold -= self.tickets_amount
      event.save
    end
  end
