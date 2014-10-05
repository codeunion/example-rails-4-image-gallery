require 'features/helper'

feature "User Account Spec" do
  scenario "A guest may create an account" do
    visit root_path
    click_link_or_button "create_account"

    fill_in "user_email", with: "zee@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_link_or_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
    expect(User.exists?(email: "zee@example.com")).to be_truthy
    expect(current_path).to eq(root_path)
  end

  scenario "A registered user may log in" do
    registered_user = User.create({ email: "registered-user@example.com",
                                    password: "password" })

    visit "/"
    click_link_or_button "sign_in"

    fill_in "user_email", with: "registered-user@example.com"
    fill_in "user_password", with: "password"

    click_link_or_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(current_path).to eq(root_path)
  end
end
