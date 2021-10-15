Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  authenticate :user do
    root 'posts#index'

    resources :posts do
      resources :comments, only: %i[ create destroy ]

      member do
        patch "upvote", to: "posts#upvote"
        patch "downvote", to: "posts#downvote"
      end
    end

    get '/pets/search' => 'pets#search', as: :search_pet

    get '/users/:id' => 'users#show', as: :user
  end

  authenticate :user, lambda { |u| u.admin == true } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
end
