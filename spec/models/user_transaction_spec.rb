# spec/models/user_transaction_spec.rb
require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
end
