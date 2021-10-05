Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  devise_for :users

  authenticate :user do
    resources :posts do
      member do
        patch "upvote", to: "posts#upvote"
        patch "downvote", to: "posts#downvote"
      end
      # resources :comments
    end
  end

  get 'pets/search' => 'pets#search', as: :search_pet_path

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
