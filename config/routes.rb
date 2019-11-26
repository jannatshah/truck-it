Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trucks do
    resources :schedules, only: [:new, :create, :edit, :update]
    resources :dishes, except: [:show]
    resources :orders, only: [:index, :new, :create]
  end

  resources :orders, only: [:show]
  resources :diets, only: [:new, :create]
end
