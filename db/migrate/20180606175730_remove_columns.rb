class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :current_price
	remove_column :products, :current_qty
	remove_column :products, :qtys


  end
end
