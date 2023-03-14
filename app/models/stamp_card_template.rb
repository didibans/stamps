class StampCardTemplate < ApplicationRecord
  belongs_to :shop
  has_many :stamp_cards
end
