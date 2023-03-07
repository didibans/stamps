class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :category
      t.string :address
      t.string :img_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
