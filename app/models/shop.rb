class Shop < ApplicationRecord
  belongs_to :user
  has_many :stamp_card_templates
  has_many :stamp_cards, through: :stamp_card_templates
end
