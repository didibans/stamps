class StampCard < ApplicationRecord
  belongs_to :user
  belongs_to :stamp_card_template
end
