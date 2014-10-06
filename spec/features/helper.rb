require 'rails_helper'
require 'capybara/rails'

module FeatureHelpers
  def  login_as(user)
    visit "/"
    click_link_or_button "sign_in"

    fill_in "user_email", with: user[:email]
    fill_in "user_password", with: user[:password]

    click_link_or_button "Log in"
  end
end

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include FeatureHelpers
end
