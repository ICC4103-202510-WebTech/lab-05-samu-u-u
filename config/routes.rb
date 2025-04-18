Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # root "users#index"
  # localhost:3000/ => controller UsersController accion index
  
  get "/users" => "users#index", as: :users
  get "/users/:id" => "users#show", as: :user
  get "/messages" => "messages#index", as: :messages
  get "/messages/:id" => "messages#show", as: :message
  get "/chats" => "chats#index", as: :chats
  get "/chats/:id" => "chats#show", as: :chat

  # localhost:3000/users => controller UsersController accion index
end
