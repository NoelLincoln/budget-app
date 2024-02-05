Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :user_transactions, only: [:index, :new, :create]
  end

  get 'all_transactions', to: 'user_transactions#all_transactions', as: :all_transactions

  root to: 'categories#index'
end
