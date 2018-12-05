Rails.application.routes.draw do
  devise_for :users
  root to: "blogs#index"
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
