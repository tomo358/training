Rails.application.routes.draw do
  root to: "blogs#index"
  resources :blogs
  devise_for :users
  resources :favorites, only: [:create, :destroy, :index]
  resources :users, only: [:index]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
