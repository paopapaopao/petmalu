require 'rails_helper'

RSpec.describe "LoginUsers", type: :system do
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

  context 'with valid input' do
    it 'fills in valid input' do
      visit root_path
      expect do
        within 'form' do
          fill_in 'Email', with: existing_user.email
          fill_in 'Password', with: existing_user.password
          click_on 'Log in'
        end
      expect(page).to have_content "Signed in successfully."
      expect(page).to have_current_path root_path
      end
    end
  end

  context 'empty input' do
    it 'clicks on login with out input' do
      visit root_path
      expect do
        within 'form' do
          fill_in 'Email', with: ""
          fill_in 'Password', with: ""
          click_on 'Log in'
        end
      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path root_path
      end
    end
  end

  context 'invalid input' do
    it 'fills in invalid email format' do
      visit root_path
      expect do
        within 'form' do
          fill_in 'Email', with: "dwawdadwads"
          fill_in 'Password', with: "dwasdwadasd"
          click_on 'Log in'
        end
      expect(page).to have_content "Please enter an email address."
      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path root_path
      end
    end
  end

  context 'invalid input' do
    it 'fills in invalid input' do
      visit root_path
      expect do
        within 'form' do
          fill_in 'Email', with: "dwawdadwads@yahoo.com"
          fill_in 'Password', with: "dwasdwadasd"
          click_on 'Log in'
        end
      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path root_path
      end
    end
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
