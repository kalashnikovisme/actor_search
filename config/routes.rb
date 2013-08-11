ActorSearch::Application.routes.draw do
  root to: "users#new"

  resources :users, except: [:index, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :actors
end
