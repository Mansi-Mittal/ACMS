class AddUserIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products , :user_id, :string
  end
end
