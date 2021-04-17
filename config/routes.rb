Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:index, :create, :destroy]
    resource :like, only: [:show, :create, :destroy]
  end

  resources :favorites, only: [:index]
  resource :profile, only: [:show, :update]

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resources :populars, only: [:index]
  resources :search, only: [:index]
  resources :tags, only: [:index]
  resources :prefectures, only: [:index, :show]

  resources :questions, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :answers, only: [:index, :create, :destroy]
  end
end