Rails.application.routes.draw do
  root 'hello#index'
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  post 'orders/:id' => 'orders#show',as: 'order'
  post 'orders/new' => 'orders#new'
  post 'orders/:id/edit' => 'orders#edit', as:'edit_order'
  devise_for :students
  resources :students, only: [:index, :show]
  devise_for :requesters
  resources :requesters, only: [:index, :show, :edit, :update]
  

  resources :orders do
    resources :likes, only: [:create, :destroy]
  end

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  

end
