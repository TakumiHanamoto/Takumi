Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'requesters/index'
  get 'requesters/show'
  devise_for :students
  devise_for :requesters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
