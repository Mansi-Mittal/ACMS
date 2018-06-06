class AddImageToOffers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :offers, :image
  end

  def down
    remove_attachment :offers, :image
  end
end
