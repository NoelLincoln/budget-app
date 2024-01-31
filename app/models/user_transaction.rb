# app/models/user_transaction.rb
class UserTransaction < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :group
  validates :name, :amount, :created_at, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
