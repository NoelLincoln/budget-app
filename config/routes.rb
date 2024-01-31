Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :user_transactions, only: [:index, :new, :create]
  end

  root to: 'categories#index'
end
