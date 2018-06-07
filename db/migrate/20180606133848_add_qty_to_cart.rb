class AddQtyToCart < ActiveRecord::Migration[5.1]
  def change
   	 add_column :carts, :qty, :integer

  end
end
