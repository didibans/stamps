class Shop < ApplicationRecord
  belongs_to :user
  has_many :stamp_card_templates
  has_many :stamp_cards, through: :stamp_card_templates
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
