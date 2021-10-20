class Eventstablechanges < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :tickets_total, :integer
    add_column :events, :tickets_sold, :integer, :default => 0
    add_column :events, :tickets_price, :decimal
  end
end
