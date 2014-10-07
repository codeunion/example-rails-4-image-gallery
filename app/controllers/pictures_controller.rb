class PicturesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.create(safe_picture_params)
    flash[:notice] = "You've uploaded a picture!"
    redirect_to root_path
  end

  private
  def safe_picture_params
    params.require(:picture).permit(:name, :description, :picture)
  end
end
