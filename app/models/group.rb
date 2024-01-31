# app/models/group.rb
class Group < ApplicationRecord
  belongs_to :user
  has_many :user_transactions
  validates :name, :icon, :created_at, presence: true
end
