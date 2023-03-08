class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]

  def index
    @shops = policy_scope(Shop)
  end

  def show
    authorize @shop
    @stamp_card_template = StampCardTemplate.find_by(shop: @shop)
    @stamp_card = StampCard.find_by(stamp_card_template: @stamp_card_template)
    @markers = [
      {
        lat: @shop.latitude,
        lng: @shop.longitude
      }
    ]
  end

  def new
    @shop = Shop.new
    authorize @shop
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user

    authorize @shop

    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @shop
  end

  def update
    authorize @shop
    @shop.update(shop_params)
  end

  def destroy
    authorize @shop
    @shop.destroy
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :category, :address, :img_url)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
