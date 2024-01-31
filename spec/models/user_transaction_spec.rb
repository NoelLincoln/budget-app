# spec/models/user_transaction_spec.rb
require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  it { should belong_to(:user).with_foreign_key(:author_id) }
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:created_at) }
  it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
end
