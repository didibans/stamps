class StampCardsController < ApplicationController
  FINISHED = false

  def stampit
    @finished = FINISHED
    user = User.find(params[:user_id])
    shop = current_user.shops[0]
    stamp_card_template = shop.stamp_card_templates[0]
    @stamp_card = StampCard.find_by(user_id: user.id, stamp_card_template_id: stamp_card_template.id)
    if @stamp_card.present?
      if @stamp_card.stamp_amount == 10
        authorize @stamp_card
        @finished = true
      end
      @stamp_card.stamp_amount += 1
      @stamp_card.update(stamp_amount: @stamp_card.stamp_amount)
      authorize @stamp_card
    else
      new = StampCard.create(stamp_amount: 1, user_id: user.id, stamp_card_template_id: stamp_card_template.id)
      authorize new
    end
  end

  def index
    @stamp_cards = policy_scope(StampCard)
  end

  # def destroy
  #   # @finished = FINISHED
  #   # authorize @finished
  #   @stamp_card = StampCard.find_by(user_id: params[:user_id], stamp_card_template_id: params[:stamp_card_template_id])
  #   authorize @stamp_card
  #   @stamp_card.destroy
  # end
end
