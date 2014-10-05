require 'rails_helper'
require 'capybara/rails'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end
