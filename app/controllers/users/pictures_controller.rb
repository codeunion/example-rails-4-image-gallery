module Users
  class PicturesController < ApplicationController
    before_filter :authenticate_user!, only: [:index]

    def index
      @pictures = current_user.pictures
    end

    def show
      @picture = User.find(params[:user_id]).pictures.find(params[:id])
    end
  end
end
