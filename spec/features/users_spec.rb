require 'rails_helper'

RSpec.feature "Users", type: :feature do
    scenario "Navigate to sign up page" do
        visit new_user_registration_path
        fill_in "Email", with: "test@gmail.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content("Projects")
    end

    #scenario "Create account, sign out, sign in, sign out" do
    #    visit destroy_user_session_path
    #end
end