class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.date :start
      t.date :end
      t.string :IMAGE_URL

      t.timestamps
    end
  end
end
