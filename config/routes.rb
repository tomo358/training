Rails.application.routes.draw do
  get 'relationships/create'

  get 'relationships/destroy'

  root to: "blogs#index"
  resources :blogs
  devise_for :users
  resources :favorites, only: [:create, :destroy, :index]
  resources :users, only: [:index]

  get '/user', to: 'users#user'
  post '/user', to: 'users#user'

  get 'select_user', to: 'users#select_user'
  post 'select_user', to: 'users#select_user'

  resources :relationships, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
