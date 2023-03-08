class StampCardTemplatesController < ApplicationController
  def new
    @stamp_card_template = StampCardTemplate.new
    authorize @stamp_card_template
  end

  def create
    @stamp_card_template = StampCardTemplate.new(stamp_card_template_params)
    @stamp_card_template.shop_id = params[:shop_id]

    authorize @stamp_card_template

    if @stamp_card_template.save
      redirect_to shop_path(params[:shop_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def stamp_card_template_params
    params.require(:stamp_card_template).permit(:max_stamps, :title, :description, :expiration_date)
  end
end
