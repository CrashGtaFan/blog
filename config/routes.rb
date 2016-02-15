Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'sessions/new'

  resources :users do
    get :change_permission, on: :member
  end

  resources :categories do
    resources :posts
  end

  resources :sessions

  resources :posts do
    get :favourite, on: :member
    resources :comments
  end

  root 'posts#index'

  get '/about', to: 'pages#about'
end
