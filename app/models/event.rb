# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :orders
  validates_presence_of :name, :tickets_total
  
  def formatted_time
    time.strftime("%d %B %Y, %H:%M")
  end
end
