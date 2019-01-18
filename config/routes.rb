Rails.application.routes.draw do
  devise_for :users
  root to: "blogs#index"
  resources :blogs
  resources :favorites, only: [:create, :destroy, :index]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
