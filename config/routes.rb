Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  scope module: :public do
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
    end
    root to: 'homes#top'

    resources :words, except: [:new,:edit,:update]
  end

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :users, only: [:show, :update]
    root to: 'users#index'

    resources :words, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
