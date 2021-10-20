class Removepricefromtickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :price
    remove_column :tickets, :available
  end
end
