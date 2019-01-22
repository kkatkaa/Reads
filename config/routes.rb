Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'welcome/index'

  get 'users/index'

  resources :books do
    resources :comments
    resources :favorites, only: [:create, :destroy]
  end
  resources :authors
end
