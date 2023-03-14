class StampCardsController < ApplicationController
  # @result = false
  # increase_progress if @result == true

  # def create
  #   @stamp_card = StampCard.new(stamp_amount: 1)
  #   @stamp_card.user = @user
  #   @stamp_card.stamp_card_template = @stamp_card_template
  #   authorize @stamp_card
  #   @stamp_card.save
  # end

  # def update
  #   @stamp_card_template = @shop.stamp_card_template
  #   @stampcard = StampCard.find_by(user_id: @user_id, stamp_card_template_id: @stamp_card_template_id)
  #   if @stampcard
  #     if stamp_amount < stamp_card_templates.max_stamps
  #       @stampcard.stamp_amount += 1
  #     else
  #       # logic for redeeming
  #     end
  #   else
  #     create
  #   end
  # end

  def stampit
    user = User.find(params[:user_id])
    shop = current_user.shops[0]
    stamp_card_template = shop.stamp_card_templates[0]
    stamp_card = StampCard.where(user: user, stamp_card_template: stamp_card_template)
    if stamp_card.present?
      stamp_card[0].stamp_amount += 1
      stamp_card[0].update(stamp_amount: stamp_card[0].stamp_amount)
      authorize stamp_card[0]
    else
      new = StampCard.create(stamp_amount: 1, user_id: user.id, stamp_card_template_id: stamp_card_template.id)
      authorize new
    end
    #redirect_to shop_path(shop)
  end

  def index
    @stamp_cards = policy_scope(StampCard)
  end
  # private

  # def stamp_card_params
  #   params.require(:stamp_card).permit(:stamp_amount)
  # end
end
