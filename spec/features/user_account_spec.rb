require 'features/helper'

feature "User Account Spec" do
  def  login_as(user)
    visit "/"
    click_link_or_button "sign_in"

    fill_in "user_email", with: user[:email]
    fill_in "user_password", with: user[:password]

    click_link_or_button "Log in"
  end

  scenario "A guest may create an account" do
    guest = Fixtures::Users[:guest]

    visit root_path
    click_link_or_button "create_account"

    fill_in "user_email", with: guest[:email]
    fill_in "user_password", with: guest[:password]
    fill_in "user_password_confirmation", with: guest[:password]

    click_link_or_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
    expect(User.exists?(email: guest[:email])).to be_truthy
    expect(current_path).to eq(root_path)
  end

  context "A registered user" do
    let(:registered_user) { Fixtures::Users[:registered] }
    before { User.create(registered_user) }

    scenario "may log in" do
      login_as(registered_user)

      expect(page).to have_content("Signed in successfully")
      expect(current_path).to eq(root_path)
    end

    scenario "may log out" do
      login_as(registered_user)

      click_link_or_button "sign_out"

      expect(page).to have_content("Signed out successfully")
    end
  end
end
