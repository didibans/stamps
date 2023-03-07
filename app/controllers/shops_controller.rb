class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]

  def index
    @shops = policy_scope(Shop)
  end

  def show
    authorize @shop
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
