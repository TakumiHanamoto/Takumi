Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'requesters/index'
  get 'requesters/show'
  devise_for :students
  resources :students, only: [:show]
  devise_for :requesters
  resources :requesters, only: [:show]
  root 'hello#index'
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'

  resources :orders do
    resources :likes, only: [:create, :destroy]
  end

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  
  post 'orders/new' => 'orders#new'
end
