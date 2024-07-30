Rails.application.routes.draw do
  # Admin routes
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :mangas do
      collection do
        get 'analysis'
      end
      resources :chapters, only: [:new, :create, :index]
    end
    resources :users, only: [:index, :show]
    get 'dashboard', to: 'dashboard#index'
  end

  # User routes
  resources :registration, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :passwords, only: [:edit, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]

  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'dashboard', to: 'dashboard#index', as: 'user_dashboard'

  patch 'mangas/:id/update_rating', to: 'dashboard#update_rating', as: 'update_rating'
  get 'mangas/:id', to: 'dashboard#show', as: 'manga'

  resources :mangas, only: [] do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  root "main#index"
end
