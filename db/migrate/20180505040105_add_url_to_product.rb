class AddUrlToProduct < ActiveRecord::Migration[5.1]
  def change
  	    add_column :products, :Image_Url, :string
  end
end
