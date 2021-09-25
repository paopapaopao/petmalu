Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  devise_for :users

  authenticate :user do
    resources :posts do
      resources :comments
    end
  end

  get 'pets/search' => 'pets#search', as: :pets_search

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
