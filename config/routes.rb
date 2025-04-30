Rails.application.routes.draw do
  resources :users
  resources :chats
  resources :messages

  root "users#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
