require 'features/helper'

feature "Viewing Images Spec" do
  scenario "A user may see all of their Pictures" do
    user_hash = Fixtures::Users[:registered]
    user = User.create(user_hash)
    pictures = 4.times.map do
      user.pictures.create(Fixtures.random(:picture))
    end

    login_as(user_hash)
    click_link_or_button "my_pictures"

    pictures.each do |picture|
      expect(page).to have_picture(picture)
    end
  end
end
