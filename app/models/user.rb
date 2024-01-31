# app/models/user.rb
class User < ApplicationRecord
  has_many :user_transactions, foreign_key: :author_id
  has_many :groups
  validates :name, presence: true, uniqueness: true
end
