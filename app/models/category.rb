# app/models/category.rb
class Category < ApplicationRecord
  has_many :user_transactions, dependent: :destroy
end