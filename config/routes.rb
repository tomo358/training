Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'

  root to: "blogs#index"
  resources :blogs
  devise_for :users
  resources :favorites, only: [:create, :destroy, :index]
  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
