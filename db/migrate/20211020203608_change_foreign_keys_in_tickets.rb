class ChangeForeignKeysInTickets < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tickets, :events
    remove_column :tickets, :event_id
    add_column :tickets, :order_id, :integer
    add_foreign_key :tickets, :orders
  end
end
