Rails.application.routes.draw do
  devise_for :users
  root to: 'trucks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trucks do
    resources :schedules, only: [:new, :create, :edit, :update]
    resources :dishes, except: [:index, :show]
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:show] do
    resources :selections, only: [:new, :create]
  end
  resources :selections, only: [:destroy]
  resources :diets, only: [:new, :create]
end
