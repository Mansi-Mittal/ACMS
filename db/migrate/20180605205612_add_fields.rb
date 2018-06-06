class AddFields < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :products, :current_price, :string
  	  	add_column :products, :current_qty, :string
  end
end
