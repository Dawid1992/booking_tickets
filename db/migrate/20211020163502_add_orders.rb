class AddOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :tickets_amount, null: false
      t.integer :status, default: 0
      t.datetime :expiration_time, precision: 6, null: false

      t.timestamps
    end
  end
end
