require 'features/helper'

feature "Image Upload Spec" do
  scenario "A logged in user may upload a Picture" do
    user_hash = Fixtures::Users[:registered]
    user = User.create(user_hash)

    login_as(user_hash)
    click_link_or_button "upload_picture"

    attach_file "picture_picture", Fixtures.image_path("adorable-kitten.jpg")

    fill_in "picture_caption", with: "a cool picture"
    fill_in "picture_description", with: "some random gibberish"

    click_link_or_button "commit"

    latest_picture = Picture.last

    expect(latest_picture.owner).to eq user
    expect(page).to have_content("You've uploaded a picture!")
    expect(page.current_path).to eq user_pictures_path(user)
  end

  scenario "A picture must include all required fields to be uploaded" do
    user_hash = Fixtures::Users[:registered]
    user = User.create(user_hash)

    login_as(user_hash)

    click_link_or_button "upload_picture"

    click_link_or_button "commit"

    expect(Picture.last).to be_nil
    expect(page).to have_content("Caption can't be blank")
    expect(page).to have_content("Picture must be provided to upload")
    expect(page.current_path).to eq pictures_path
  end

  scenario "A guest may not upload a picture" do
    visit root_path
    expect(page).not_to have_selector "#upload_picture"
    visit new_picture_path
    expect(page.current_path).to eq new_user_session_path
  end
end

