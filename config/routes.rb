Rails.application.routes.draw do
  root 'hello#index'
  post 'orders/:id' => 'orders#show',as: 'order'
  post 'orders/new' => 'orders#new'
  post 'orders/:id/edit' => 'orders#edit', as:'edit_order'
  devise_for :students, controllers: {
    sessions:       'students/sessions',
    passwords:      'students/passwords',
    registrations:  'students/registrations'
  }
  resources :students, only: [:index, :show]

  devise_for :requesters, controllers: {
    sessions:       'requesters/sessions',
    passwords:      'requesters/passwords',
    registrations:  'requesters/registrations'
  }
  resources :requesters, only: [:index, :show, :edit, :update]
  

  resources :orders do
    resources :likes, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :rooms, :only => [:create, :show, :index] do
  resources :messages, :only => [:create]
  end

end
