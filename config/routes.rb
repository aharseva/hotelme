Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bookings, only: [:show, :index, :create] 
  resources :hotels do
    resources :bookings, only: [:create]
  end
end 
