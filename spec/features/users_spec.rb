require 'rails_helper'

RSpec.feature "Users", type: :feature do
    scenario "Navigate to sign in page" do
        visit new_user_session_path
        expect(page).to have_content("Sign up")
    end
end