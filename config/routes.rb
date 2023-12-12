# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :projects do
    resources :accounts, only: [:new, :create, :index, :edit, :update, :destroy]
    resource :maintainers, only: [:edit]
    resources :maintainers, only: [] do
      resource :connection, only: [:create, :destroy], controller: 'maintainers', path: ''
    end
    resources :links, only: [:new, :create, :index, :edit, :update, :destroy]
  end
  resources :users, only: [:new, :create, :edit, :update, :index] do
    resource :admin, only: [:create, :destroy]
  end
end
