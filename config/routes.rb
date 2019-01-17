Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'welcome/index'

  root 'users#index'
  get 'users/index'

  resources :books do
    resources :comments
  end
  resources :authors
end
