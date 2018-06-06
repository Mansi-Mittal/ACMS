class AddFieldsToProducts < ActiveRecord::Migration[5.1]
  def change
  	    add_column :products, :sub_category, :string
  	    add_column :products, :sizes, :string, default: [].to_yaml
  	    add_column :products, :qtys, :integer, default: [].to_yaml
  	    add_column :products, :tags, :string, default: [].to_yaml
  	    add_column :products, :colour, :string
  	    add_column :products, :brand, :string
  	    add_column :products, :discounted_price, :integer
  	    add_column :products, :discount_starts, :integer
  	    add_column :products, :discounted_ends, :integer
  end
end
