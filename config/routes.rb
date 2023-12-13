Rails.application.routes.draw do
  root 'home#index'

  post 'reservations/confirm', as: 'confirm'

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :accounts, only: [:show]

  resources :rooms

  resources :reservations, only: [:index, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
