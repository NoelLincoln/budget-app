# app/models/category.rb
class Category < ApplicationRecord
  belongs_to :user
  has_many :user_transactions, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true
  validates :icon_url, presence: true
  validates :amount, presence: true

end
