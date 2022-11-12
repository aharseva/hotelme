Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :hotels do 
    resources :bookings, only: [:show, :index, :create] 
  end
end 
