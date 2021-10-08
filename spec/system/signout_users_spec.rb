require 'rails_helper'

RSpec.describe "SignoutUsers", type: :system do
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

  context 'clicking sign out button' do
    it 'redirects user to sign in page' do
      visit root_path
      expect do
        # within 'form' do
        fill_in 'Email', with: existing_user.email
        fill_in 'Password', with: existing_user.password
        click_on "Log in"
        click_on "Sign out"
        # end
      expect(page).to have_content "You need to sign in or sign up before continuing."
      expect(page).to have_current_path root_path
      end
    end
  end
      

  pending "add some scenarios (or delete) #{__FILE__}"
end
