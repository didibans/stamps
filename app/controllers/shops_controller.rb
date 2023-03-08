class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      # @shops = policy_scope(Shop).where(category: params[:query])
      sql_query = "category ILIKE :query OR name ILIKE :query"
      @shops = policy_scope(Shop).where(sql_query, query: "%#{params[:query]}%")
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "shared/list", locals: { shops: @shops }, formats: [:html] }
      end
    else
      @shops = policy_scope(Shop)
    end
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
