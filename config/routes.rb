Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users, only: [] do
    resources :pictures, only: [:index, :show], controller: "users/pictures"
  end
  resources :pictures, only: [:new, :create]
end
