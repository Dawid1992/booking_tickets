class AddKeyToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :unique_key, :string
  end
end
