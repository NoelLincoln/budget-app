# spec/models/group_spec.rb
require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:user_transactions) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:icon) }
  it { should validate_presence_of(:created_at) }
end
