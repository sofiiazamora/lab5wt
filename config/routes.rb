Rails.application.routes.draw do
  # Primero Devise para evitar conflictos con /users/sign_in, etc.
  devise_for :users

  # Luego tus recursos
  resources :users
  resources :chats
  resources :messages

  # Página principal
  root "users#index"

  # Ruta de prueba de salud
  get "up" => "rails/health#show", as: :rails_health_check
end
