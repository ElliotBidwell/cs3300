require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      testUser = FactoryBot.create(:user)
      sign_in testUser
      visit new_project_path
      find_field("project[title]").set('Test title')
      # within("form", match: :prefer_exact) do
      #   fill_in "title", with: "Test title"
      # end
    end

    scenario "Create with valid description" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "Create with empty description" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
    
    scenario "Create and check if at show page" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Edit this project")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      testUser = FactoryBot.create(:user)
      sign_in testUser
      visit edit_project_path(project)
    end

    scenario "Edit with valid description" do 
      find_field("project[description]").set('Test description')
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "Edit with empty description" do
      find_field("project[description]").set('')
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      testUser = FactoryBot.create(:user)
      sign_in testUser
      visit projects_path
      click_link "Show this project"
      click_link "Destroy this project"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end

  context "Visit pages" do
    scenario "Check rendering of form on new project page" do
      visit new_project_path
      expect(page).to have_content("New project")
    end
  end

end
