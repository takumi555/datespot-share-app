Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[index create destroy]
    resource :like, only: %i[show create destroy]
  end

  resources :favorites, only: [:index]
  resource :profile, only: %i[show update]

  resources :accounts, only: %i[index show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end

  resources :populars, only: [:index]
  resources :search, only: [:index]
  resources :tags, only: [:index]
  resources :taglists, only: [:index]
  resources :prefectures, only: %i[index show]

  resources :timelines, only: [:index]

  resources :questions, only: %i[index new create show edit update destroy] do
    resources :answers, only: %i[index create destroy]
  end

  resources :rooms, only: %i[index create show]
  resources :messages, only: [:create]

  resources :notifications, only: [:index]
end
