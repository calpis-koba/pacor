Rails.application.routes.draw do
     root 'users/items#index'
  namespace :users, :path => ""  do
    resources :items, only:[:index, :show, :destory]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    get '/cart_items/top', to: 'cart_items#top'
    resources :orders, only:[:index, :new, :create]
    resources :addresses, only:[:create, :edit, :update, :destroy]
    
    resource :user, :only => [:edit, :show, :update] do
      get 'unsubscribe_confirm'
      patch 'unsubscribe'
    end

  end
  
  namespace :admins do
    resources :jenres, only:[:index, :create, :edit, :update, :destroy]
    resources :artists, only:[:index, :create, :edit, :update, :destroy]
    resources :labels, only:[:index, :create, :edit, :update, :destroy]
    resources :items, only:[:index, :show, :new, :create, :edit, :update, :destroy]
    resources :labels, only:[:index, :new, :create]
    resources :addresses, only:[:destroy]
    resources :users, only:[:index, :show, :edit, :update, :destroy]
    resources :orders, only:[:index, :show, :update]
  	root "items#index"
  end
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
