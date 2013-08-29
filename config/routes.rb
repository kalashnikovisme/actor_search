ActorSearch::Application.routes.draw do
  root to: "users#new"

  resources :users, except: [:index, :edit, :update] do
    member do
      resources :photos, only: [:new, :create, :destroy]
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :actors
  resources :models
  resources :searchers, except: :index do
    member do
      resources :accesses, except: [ :show, :edit, :update ]
    end
  end
end
