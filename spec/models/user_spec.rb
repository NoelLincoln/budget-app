# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:user_transactions).with_foreign_key(:author_id) }
  it { should have_many(:groups) }
end
