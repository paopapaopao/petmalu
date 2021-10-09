require 'rails_helper'

RSpec.describe "CreatePosts", type: :system do

  # spec did not require log in? why?


  # let :user do
  #   User.create(
  #     email: "test@test.com",
  #     password: "qweqwe",
  #     confirmed_at: DateTime.now,
  #     first_name: "rspec",
  #     last_name: "rspec",
  #     approved: true
  #   )
  # end
  
  # def login(user)
  #   visit root_path
  #   within 'form' do
  #     fill_in 'Email', with: user.email
  #     fill_in 'Password', with: user.password
  #     click_on 'Log in'
  #   end
  # end

  before do
    driven_by(:rack_test)
    # login(user)
  end

  context 'valid input' do
    it 'fill in valid input for post' do
      expect do
        within 'form' do
          fill_in 'content', with: 'sample post'
          click_on 'Create Post'
        end
      expect(page).to have_content 'Post was successfully created.'
      expect(page).to have_content 'Add a comment:'
      expect(page).to have_current_path post_path
      end
      # expect(Post.last.content).to eq('sample post')
    end
  end

  context 'invalid input' do
    it 'empty input for post' do
      expect do
        within 'form' do
          fill_in 'content', with: ""
          click_on 'Create Post'
        end
      expect(page).to have_content "Content can't be blank"
      expect(page).to have_current_path post_path
      end
    end
  end



  pending "add some scenarios (or delete) #{__FILE__}"
end
