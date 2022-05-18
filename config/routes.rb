# frozen_string_literal: true

Rails.application.routes.draw do
  resources :images
  devise_for :users
  resources :articles do
    post 'like', on: :member
    post 'shared', on: :member
  end
  root to: 'pages#home'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'serch_article', to: 'articles#search'
  resources :likes, only: [:index]
  # resources:shareds, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
