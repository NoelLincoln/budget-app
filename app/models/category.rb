# app/models/category.rb
class Category < ApplicationRecord
  belongs_to :user
  has_many :user_transactions, dependent: :destroy
  has_one_attached :icon

  attr_accessor :icon_url

  validates :name, presence: true
  validates :icon, presence: true
  validates :amount, presence: true

end
