require 'features/helper'

feature "Image Upload Spec" do
  scenario "A logged in user may upload a Picture" do
    user_hash = Fixtures::Users[:registered]
    user = User.create(user_hash)

    login_as(user_hash)
    click_link_or_button "upload_picture"

    attach_file "picture_picture", Fixtures.image_path("adorable-kitten.jpg")

    fill_in "picture_caption", with: "A cool picture"
    fill_in "picture_description", with: "Some random gibberish"

    click_link_or_button "commit"

    latest_picture = Picture.last

    expect(latest_picture.owner).to eq user
  end
end

