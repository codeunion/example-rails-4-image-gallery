require 'features/helper'

feature "Viewing Images Spec" do
  let(:user_hash) { Fixtures::Users[:registered] }
  let(:user) { User.create(user_hash) }
  let!(:pictures) do
    4.times.map do
      user.pictures.create(Fixtures.random(:picture))
    end
  end

  scenario "A user may see all of their Pictures" do

    login_as(user_hash)
    click_link_or_button "my_pictures"

    pictures.each do |picture|
      expect(page).to have_picture(picture)
    end
  end

  scenario "A guest may see a picture given it's full URL" do
    visit user_picture_path(user, pictures.first)
    expect(page).to have_picture(pictures.first)
  end
end
