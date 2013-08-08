ActorSearch::Application.routes.draw do
  root to: "users#new"

  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
