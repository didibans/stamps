class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    unless current_user
      redirect_to new_user_session_path
    end
    stamp_cards = StampCard.where(user_id: current_user.id)
    case stamp_cards.length
    when (3..300)
      @stamp_card1 = StampCard.where(user_id: current_user.id).order(stamp_amount: :desc)[0]
      @stamp_card2 = StampCard.where(user_id: current_user.id).order(stamp_amount: :desc)[1]
      @stamp_card3 = StampCard.where(user_id: current_user.id).order(stamp_amount: :desc)[2]
    when 2
      @stamp_card1 = StampCard.where(user_id: current_user.id).order(stamp_amount: :desc)[0]
      @stamp_card2 = StampCard.where(user_id: current_user.id).order(stamp_amount: :desc)[1]
    when 1
      @stamp_card1 = StampCard.where(user_id: current_user.id).order(stamp_amount: :desc)[0]
      # else
    end
  end
end
