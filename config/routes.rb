Rails.application.routes.draw do

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

  namespace :admin do

    get '' => 'admins#top'

    resources :genres, only: [:show]

    resources :orders, only: [:index, :show, :update]

    resources :arrivals, only: [:index, :update]

    resources :users, only: [:index, :show, :update, :destroy] do
      get :orders, on: :member
    end

    resources :items do
      resources :arrivals, only: [:new, :create, :edit, :update]
    end
    patch '/admins/items/:id/edit', to: 'items#update'

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :items, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy]
    resources :item_colors do
      resources :item_color_sizes do
        resource :carts, only: [:create]
      end
    end
    get :genre, on: :collection
  end

  ## exceptは ~を除く
  resources :orders, except: [:new] do
    get :complete, on: :member
  end

  resources :carts, only: [:create]

  resources :genres, only: [:show]

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :addresses, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :carts, only: [:index, :new, :update, :destroy]
    resources :favorites, only: [:index]
  end
end
