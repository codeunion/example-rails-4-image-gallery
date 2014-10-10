module Users
  class PicturesController < ApplicationController
    before_filter :authenticate_user!, only: [:index]

    def index
      @pictures = current_user.pictures
    end
  end
end
