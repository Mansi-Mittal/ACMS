class AddQtystringToproduct < ActiveRecord::Migration[5.1]
  def change
  	    add_column :products, :qtySize, :string, default: [].to_yaml

  end
end
