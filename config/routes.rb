Rails.application.routes.draw do
  devise_for :admins
  devise_for :students
  devise_for :requesters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'hello#index'
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'

  resources :orders do
    resources :likes, only: [:create, :destroy]
  end
  
  post 'orders/new' => 'orders#new'
end
