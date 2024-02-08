Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :user_transactions, only: [:index]
  end

  resources :user_transactions, only: [:create, :new]

  get 'all_transactions', to: 'user_transactions#all_transactions', as: :all_transactions

  authenticated :user do

    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root 'home#index', as: :unauthenticated_root
  end
end
