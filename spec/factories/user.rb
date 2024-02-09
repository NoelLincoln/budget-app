# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'user1' }
    email { 'user@example.com' }
    password { 'testing' }
  end
end

