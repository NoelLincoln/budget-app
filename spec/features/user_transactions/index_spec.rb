require 'rails_helper'

RSpec.describe 'UserTransactions', type: :feature do
  let(:category) { FactoryBot.create(:category) }
  let(:user_transactions) { create_list(:user_transaction, 0, category:) }
  let(:total_amount) { user_transactions.sum(&:amount) }

  before do
    visit category_user_transactions_path(category)
    puts page.html
  end

  it 'displays the category name and total amount' do
    expect(page).to have_content("#{category.name} Transactions")
    expect(page).to have_content("Total Amount: $#{total_amount}")
  end

  it 'displays each user transaction with its details' do
    user_transactions.each do |transaction|
      expect(page).to have_css('.card-body', text: transaction.name)
      expect(page).to have_css('.card-body', text: transaction.created_at.strftime('%d %b %Y'))
      expect(page).to have_css('.card-body', text: "$#{transaction.amount}")
    end
  end
end
