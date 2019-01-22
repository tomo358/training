Rails.application.routes.draw do
  root :to => 'oauth_test#index'
  get 'oauth_test/index'
  get 'relationships/create'
  get 'relationships/destroy'


  resources :blogs
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :favorites, only: [:create, :destroy, :index]
  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
