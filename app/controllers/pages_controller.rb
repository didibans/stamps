class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    unless current_user
      redirect_to new_user_session_path
    end
    @shop = Shop.last
    @stamp_card_template = @shop.stamp_card_templates[0]
    @stamp_cards = StampCard.where(user_id = @current_user_id)
  end
end
