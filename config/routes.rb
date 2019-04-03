Rails.application.routes.draw do
  root 'home#index'
  post 'home/search', to: 'home#search'
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :profiles, only: [:new, :create, :show, :edit, :update]

  resources :artists, only: [:index]

  get 'about' => 'about#index'

  patch 'listings/:listing_id/biddings/:id/approve' => 'biddings#approve'
  patch 'listings/:listing_id/biddings/:id/deny' => 'biddings#deny'

  resources :listings do
    resources :biddings
  end

  resources :charges, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
