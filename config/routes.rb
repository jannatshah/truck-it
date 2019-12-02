Rails.application.routes.draw do
  devise_for :users
  root to: 'trucks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trucks do
    resources :schedules, only: [:new, :create, :edit, :update]
    resources :dishes, except: [:index, :show]
    resources :reviews, only: [:new, :create]
    # resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:show] do
    resources :payments, only: :new
    member do
      get 'confirmation', to: 'orders#confirmation', as: :confirmation
      get 'create_session', to: 'orders#create_session', as: :create_session
    end
    resources :selections, only: [:new, :create]
  end
  resources :selections, only: [:destroy] do
    member do
      delete 'destroy_from_order', to: 'selections#destroy_from_order', as: :destroy_from_order
    end
  end
  resources :diets, only: [:new, :create]

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
