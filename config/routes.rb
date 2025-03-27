# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'auth', controllers: { registrations: 'auth/registrations' }
  resource :magic_link, only: [:create, :show]

  resources :forms, only: [:show]
  resources :feedbacks, only: [:create]
  get 'thank_you', to: 'static_pages#form_submission'

  authenticated do
    resources :projects, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :accounts, only: [:new, :create, :index, :edit, :update, :destroy]
      resource :maintainers, only: [:edit]
      resources :maintainers, only: [] do
        resource :connection, only: [:create, :destroy], controller: 'maintainers', path: ''
      end
      resources :links, only: [:new, :create, :index, :edit, :update, :destroy]
    end
    resources :users, only: [:new, :create, :edit, :update, :index] do
      resource :admin, only: [:create, :destroy]
      resource :deactivate, only: [:destroy]
    end
    resources :forms, only: [:index] do
      member do
        post :send_form
      end
    end
    resources :feedbacks, only: [:index]
  end
end
