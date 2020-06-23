Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sweets#index'
  resources :users, only: [:show, :index, :edit, :update]
  resources :sweets, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :sweet_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :notifications, only: [:index]
end
