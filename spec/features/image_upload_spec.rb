require 'features/helper'

feature "Image Upload Spec" do
  let(:user_hash) { Fixtures::Users[:registered] }
  let(:user) { User.create(user_hash) }
  scenario "A logged in user may upload a Picture" do
    login_as(user)
    visit root_path
    click_link_or_button "upload_picture"

    attach_file "picture_picture", Fixtures.image_path("adorable-kitten.jpg")

    fill_in "picture_caption", with: "A cool picture"
    fill_in "picture_description", with: "Some random gibberish"

    click_link_or_button "commit"
  end
end

