class ChangeUserIdType < ActiveRecord::Migration[5.1]
  def up
    change_column :carts, :user_id, :string
    change_column :wishlists, :user_id, :string

  end

  def down
    change_column :carts, :user_id, :integer
    change_column :wishlists, :user_id, :integer

  end
end
