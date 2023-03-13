class StampCardsController < ApplicationController
  @result = false
  increase_progress if @result == true

  def create
    @stamp_card = StampCard.new(stamp_amount: 1)
    @stamp_card.user = @user
    @stamp_card.stamp_card_template = @stamp_card_template
    @stamp_card.save
  end

  def increase_progress
    @content = ""
    @stamp_card_template = @shop.stamp_card_template
    @stampcard = StampCard.find_by(user_id: @user_id, stamp_card_template_id: @stamp_card_template_id)
    if @stampcard
      if stamp_amount < stamp_card_templates.max_stamps
        @stampcard.stamp_amount += 1
      else
        # logic for redeeming
      end
    else
      create
    end
  end
end
