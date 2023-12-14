Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :accounts, only: [:show]

  resources :rooms

  resources :reservations, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      post 'confirm'
    end
    member do
      patch 'edit_confirm'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
