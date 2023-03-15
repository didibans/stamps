class StampCardsController < ApplicationController
  def index
    @stamp_cards = policy_scope(StampCard)
  end

  def stampit
    user = User.find(params[:user_id])
    shop = current_user.shops[0]
    # shop_id = shop.id
    stamp_card_template = shop.stamp_card_templates[0]
    @stamp_card = StampCard.find_by(user_id: user.id, stamp_card_template_id: stamp_card_template.id)
    if @stamp_card.present?
      if @stamp_card.stamp_amount == 10
        authorize @stamp_card
        @finished = true
      end
      @stamp_card.stamp_amount += 1
      authorize @stamp_card
      # redirect_to shop_path(shop)
      send_notification(user) if @stamp_card.update(stamp_amount: @stamp_card.stamp_amount)
    else
      new_stamp = StampCard.new(stamp_amount: 1, user_id: user.id, stamp_card_template_id: stamp_card_template.id)
      authorize new_stamp
      # redirect_to stampit_path(user)
      send_notification(user) if new_stamp.save
    end
  end

  private

  def send_notification(user)
    UserChannel.broadcast_to(
      user,
      "hallo"
    )
    # head :ok
  end
end
