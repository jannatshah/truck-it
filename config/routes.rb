Rails.application.routes.draw do
  devise_for :users
  root to: 'trucks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trucks do
    resources :schedules, only: [:new, :create, :edit, :update, :destroy]
    resources :dishes, except: [:index, :show]
    resources :reviews, only: [:new, :create]
    # resources :orders, only: [:new, :create]
    collection do
      get 'chinese'
    end
    collection do
      get 'indian'
    end
    collection do
      get 'thai'
    end
    collection do
      get 'mexican'
    end
    collection do
      get 'lebanese'
    end
    collection do
      get 'italian'
    end
    collection do
      get 'kebabs'
    end
    collection do
      get 'burgers'
    end
    collection do
      get 'hot_dogs'
    end
    collection do
      get 'ice_cream'
    end
    collection do
      get 'donuts'
    end
    collection do
      get 'pancakes'
    end
    collection do
      get 'brazilian'
    end
    collection do
      get 'tapas'
    end

    get 'truck_orders', to: 'trucks#truck_orders', as: :truck_orders

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
