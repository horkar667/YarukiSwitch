Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  scope module: :public do
    patch 'users/withdraw' => 'users#withdraw'
    get 'favorites' => 'favorites#index'
    resources :users, only: [:show, :edit, :update] do
      get :favorites
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
    end
    root to: 'homes#top'

    resources :words, except: [:new,:edit,:update] do
      resource :favorites, only: [:create, :destroy]
      resources :word_comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
  end

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :users, only: [:show, :update] do
      collection do
        get 'search'
      end
    end
    root to: 'users#index'

    resources :words, only: [:index, :show, :destroy] do
      collection do
        get 'search'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
