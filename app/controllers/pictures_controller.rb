class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(safe_picture_params)
    if @picture.persisted?
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def safe_picture_params
    params.require(:picture).permit(:name, :description, :picture)
  end
end
