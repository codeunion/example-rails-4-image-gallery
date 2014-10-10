require 'features/helper'

feature "Viewing Images Spec" do
  scenario "A user may see all of their Pictures" do
    user_hash = Fixtures::Users[:registered]
    user = User.create(user_hash)
    picture1 = user.pictures.create(Fixtures.random(:picture))
    picture2 = user.pictures.create(Fixtures.random(:picture))
    picture3 = user.pictures.create(Fixtures.random(:picture))
    picture4 = user.pictures.create(Fixtures.random(:picture))


    login_as(user_hash)
    click_link_or_button "my_pictures"

    within("#picture_#{picture1.id}") do
      expect(page).to have_css("img")
      expect(page).to have_content(picture1.caption)
    end

    within("#picture_#{picture2.id}") do
      expect(page).to have_css("img")
      expect(page).to have_content(picture2.caption)
    end

    within("#picture_#{picture3.id}") do
      expect(page).to have_css("img")
      expect(page).to have_content(picture3.caption)
    end

    within("#picture_#{picture4.id}") do
      expect(page).to have_css("img")
      expect(page).to have_content(picture4.caption)
    end
  end
end
