# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
    subject { described_class.new(name: 'Test Category', user:) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:user_transactions).dependent(:destroy) }
  end
end
