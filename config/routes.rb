Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :projects do
    resources :accounts, only: [:new, :create]
    resource :maintainers, only: [:edit]
    resources :maintainers, only: [] do
      resource :connection, only: [:create, :destroy], controller: 'maintainers', path: ''
    end
  end
  resources :users, :only => [:show]
end
