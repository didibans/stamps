class CreateStampCards < ActiveRecord::Migration[7.0]
  def change
    create_table :stamp_cards do |t|
      t.integer :stamp_amount
      t.references :user, null: false, foreign_key: true
      t.references :stamp_card_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
