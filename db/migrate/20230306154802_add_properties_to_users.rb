class AddPropertiesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :profile_img_url, :string
    add_column :users, :qr_code_id, :integer
  end
end
