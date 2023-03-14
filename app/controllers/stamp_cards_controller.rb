class StampCardsController < ApplicationController
  @result = false
  increase_progress if @result == true

  def create
    @stampcard = StampCard.find_by(user_id: @user_id, stamp_card_template_id: params[:stamp_card_template_id])
    if @stampcard
      update
    else
      @stamp_card = StampCard.new(stamp_amount: 1)
      @stamp_card.user = @user
      @stamp_card.stamp_card_template = @stamp_card_template
      authorize @stamp_card
      @stamp_card.save
    end
  end

  def update
    @stamp_card_template = @shop.stamp_card_template
    authorize
    if stamp_amount < stamp_card_templates.max_stamps
      @stampcard.stamp_amount += 1
    else
      # logic for redeeming
    end
  end

  private

  def stamp_card_params
    params.require(:stamp_card).permit(:stamp_amount)
  end
end
