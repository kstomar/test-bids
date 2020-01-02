Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :auctions do
    resources :items do
      resources :bids
      get :highest_bid
      get :my_bids
    end
  end
  resources :bids
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
