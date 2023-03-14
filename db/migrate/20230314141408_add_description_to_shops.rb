class AddDescriptionToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :description, :text
  end
end
