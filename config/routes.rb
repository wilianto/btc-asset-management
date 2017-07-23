Rails.application.routes.draw do
  get "/preview", to: "pages#preview"
  resources :ping, only: [:index]
end
