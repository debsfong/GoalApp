require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      fill_in 'password', :with => "biscuits"
      click_on "Create User"
    end

    scenario "redirects to user homepage after signup" do
      expect(page).to have_content "Homepage"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end

  end

end

feature "logging in" do
  before(:each) do
    FactoryGirl.create(:user)
    visit new_session_url
    fill_in 'username', :with => "testing_username"
    fill_in 'password', :with => "biscuits"
    click_on "Log In"
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content "testing_username"
  end

end

feature "logging out" do
  before(:each) { visit new_session_url }

  scenario "begins with a logged out state" do
    expect(page).not_to have_content "Log Out"
  end

  scenario "doesn't show username on the homepage after logout" do
    FactoryGirl.create(:user)
    visit new_session_url
    fill_in 'username', :with => "testing_username"
    fill_in 'password', :with => "biscuits"
    click_on "Log In"
    click_on "Log Out"

    expect(page).not_to have_content "testing_username"
  end

end
