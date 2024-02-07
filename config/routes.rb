Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :user_transactions, only: [:index, :new, :create]
  end

  get 'all_transactions', to: 'user_transactions#all_transactions', as: :all_transactions

  # Set the root route to the home#index action
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root 'home#index', as: :unauthenticated_root
  end
end
