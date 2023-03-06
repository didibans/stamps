class CreateStampCardTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :stamp_card_templates do |t|
      t.integer :max_stamps
      t.string :title
      t.text :description
      t.date :expiration_date
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
