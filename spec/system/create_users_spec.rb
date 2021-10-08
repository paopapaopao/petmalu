require 'rails_helper'

RSpec.describe "CreateUsers", type: :system do
  let :existing_user do
    User.create(
      email: "rspecExist@test.com",
      password: "password",
      first_name: "rspec",
      last_name: "rspec",
    )
  end
  
  before do
    driven_by(:rack_test)
  end

  context "clicking sign up link" do
    it "redirects to sign up page" do
      visit root_path
      click_on "Sign up"
      expect(page).to have_content "Sign up"
      expect(page).to have_current_path new_user_registration_path
    end
  end

  context "with valid input" do
    it "fill in valid input" do
      visit new_user_registration_path
      expect do
        # within 'form' do
        fill_in 'Email', with: 'rspec@test.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password', with: 'password'
        click_on "Sign up"
        # end
      expect(page).to have_content "Sign in"
      expect(page).to have_content "You need to sign in or sign up before continuing."
      expect(page).to have_current_path new_user_session_path
      end
    end
  end

  context "with invalid input" do
    it "fill in invalid input" do
      visit new_user_registration_path
      expect do
        # within 'form' do
        fill_in 'Email', with: 'rspectest'
        fill_in "Password", with: ""
        fill_in "Password", with: ""
        click_on "Sign up"
        # end
      expect(page).to have_content "Please enter an email address."
      expect(page).to have_current_path new_user_registration_path
      end
    end
  end

  context "with existing user" do
    it "fill in existing email" do
      visit new_user_registration_path
      expect do
        # within 'form' do
        fill_in 'Email', with: existing_user.email
        click_on "Sign up"
        # end
      expect(page).to have_current_path new_user_registration_path
      end
    end
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
