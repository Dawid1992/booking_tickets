class AddordervalueToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_value, :decimal, :default => '0.0'
    add_column :orders, :event_id, :integer
    add_foreign_key :orders, :events, on_delete: :cascade
  end
end
