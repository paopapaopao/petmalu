Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  devise_for :users

  resources :posts do
    resources :comments
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
