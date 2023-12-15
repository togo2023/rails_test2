Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :accounts, only: [:show]

  resources :rooms do
    collection do
      get 'search'
    end
  end
    
  resources :reservations, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      get 'confirm'
    end
    member do
      get 'edit_confirm'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
