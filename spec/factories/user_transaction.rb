# spec/factories/user_transactions.rb

FactoryBot.define do
  factory :user_transaction do
    name { 'Transaction' }
    amount { 100 }
    category
    author { association :user }
  end
end
