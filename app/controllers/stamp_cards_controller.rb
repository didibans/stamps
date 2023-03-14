class StampCardsController < ApplicationController
  FINISHED = false

  def index
    @stamp_cards = policy_scope(StampCard)
  end

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
      send_notification(user) if @stamp_card.update(stamp_amount: @stamp_card.stamp_amount)
      authorize @stamp_card
    else
      new_stamp = StampCard.create(stamp_amount: 1, user_id: user.id, stamp_card_template_id: stamp_card_template.id)
      authorize new_stamp
    end
  end

  private

  def send_notification(user)
      UserChannel.broadcast_to(
        user,
        "neuer stamp diggi"
        # render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok

  end

  # def destroy
  #   # @finished = FINISHED
  #   # authorize @finished
  #   @stamp_card = StampCard.find_by(user_id: params[:user_id], stamp_card_template_id: params[:stamp_card_template_id])
  #   authorize @stamp_card
  #   @stamp_card.destroy
  # end
end
