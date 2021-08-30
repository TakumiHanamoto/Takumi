Rails.application.routes.draw do
  root 'hello#index'
  post 'orders/:id' => 'orders#show',as: 'order'
  post 'orders/new' => 'orders#new'
  post 'orders/:id/edit' => 'orders#edit', as:'edit_order'
  devise_for :students
  resources :students, only: [:index, :show]
  devise_for :requesters
  resources :requesters, only: [:index, :show, :edit, :update]
  

  resources :orders do
    resources :likes, only: [:create, :destroy]
    resources :receives, only: [:create, :destroy]
  end

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  

end
