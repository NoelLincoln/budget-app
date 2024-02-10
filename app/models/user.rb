# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :user_transactions, foreign_key: :author_id
  has_many :categories
  validates :name, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
