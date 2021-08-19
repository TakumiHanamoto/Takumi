Rails.application.routes.draw do
  devise_for :requesters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'hello#index'
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  get 'orders' => 'orders#index'
  post 'orders/new' => 'orders#new'
  post 'orders' => 'orders#create'
  post 'orders/:id' => 'orders#show',as: 'order'
  patch 'orders/:id' => 'orders#update'
  delete 'orders/:id' => 'orders#destroy'
  post 'orders/:id/edit' => 'orders#edit', as:'edit_order'

end
