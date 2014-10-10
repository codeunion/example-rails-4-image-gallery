class PicturesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.create(safe_picture_params)
    if @picture.persisted?
      flash[:notice] = "You've uploaded a picture!"
      redirect_to user_pictures_path(current_user)
    else
      render :new
    end
  end

  private
  def safe_picture_params
    params.require(:picture).permit(:caption, :description, :picture)
  end
end
