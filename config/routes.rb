Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'favorites/update'

  root 'welcome#index'
  get 'welcome/index'

  get 'users/index'

  resources :books do
    resources :comments
  end
  resources :authors
end
