require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end


  feature "signing up a user" do
    let(:name) { Faker::Internet.user_name }
    let(:password) { Faker::Internet.password }

    before(:each) do
      visit new_user_url

      fill_in 'username', with: :name
      fill_in 'password', with: :password
      click_on 'Create User'
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content :name
    end

    scenario "redirect to User#show page after sign up" do
      expect(page).to have_content "Homepage"
    end
  end
end

feature "logging in" do

  scenario "has a login page" do
    visit new_session_url
    expect(page).to have_content "Login"
  end

  feature "logging in a user" do

    before(:each) do
      visit new_session_url

      @fake = FactoryGirl.create(:user)

      fill_in 'username', with: @fake.username
      fill_in 'password', with: @fake.password
      click_on 'Log In'
    end

    scenario "shows username on the homepage after login" do
      expect(page).to have_content @fake.username
    end

    scenario "redirect to User#show page after sign in" do
      expect(page).to have_content "Homepage"
    end
  end

end

feature "logging out" do

  before(:each) do
    @fake = FactoryGirl.create(:user)
  end

  it "begins with logged out state" do
    visit new_session_url
    expect(page).to_not have_content @fake.username
  end

  it "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in 'username', with: @fake.username
    fill_in 'password', with: @fake.password
    click_on 'Log In'
    click_button 'Log Out'

    expect(page).to_not have_content @fake.username
  end


end
