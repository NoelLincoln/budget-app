require 'rails_helper'

RSpec.feature 'Categories Index Page', type: :feature do
  scenario 'User can see category names and total amounts' do
    user = create_and_sign_in_user
    categories = [
      { name: 'Category 1',
        transactions: [{ name: 'Transaction 1', amount: 100 }, { name: 'Transaction 2', amount: 200 }] },
      { name: 'Category 2', transactions: [{ name: 'Transaction 3', amount: 150 }] }
    ]
    categories.each { |category_data| create_category_with_transactions(category_data, user) }
    expect_category_names_and_total_amounts(categories)
  end

  scenario 'User can click on a category to view its transactions' do
    user = create_and_sign_in_user
    category = create_category_for_user(user)
    visit_categories_index_page
    click_category_link(category)
    expect_redirected_to_category_transactions_page(category)
  end

  scenario 'User can add a new category' do
    create_and_sign_in_user
    visit_categories_index_page
    click_add_new_category_link
    expect_redirected_to_new_category_page
  end

  private

  def create_and_sign_in_user
    user = create(:user)
    user.confirm
    sign_in(user)
    user
  end

  def create_category_with_transactions(category_data, user)
    category = create(:category, name: category_data[:name], user:,
                                 icon: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test.png'),
                                                           'image/png'))
    calculate_total_amount(category_data[:transactions])
    category_data[:transactions].each do |transaction_data|
      create(:user_transaction, name: transaction_data[:name], amount: transaction_data[:amount], category:,
                                author: user)
    end
    category
  end

  def expect_category_names_and_total_amounts(categories)
    categories.each do |category_data|
      expect(page).to have_content(category_data[:name])
      expect(page).to have_content("$#{calculate_total_amount(category_data[:transactions])}")
    end
  end

  def create_category_for_user(user)
    create(:category, name: 'Category 1', user:,
                      icon: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'images', 'test.png'), 'image/png'))
  end

  def visit_categories_index_page
    visit categories_path
  end

  def click_category_link(category)
    click_link category.name
  end

  def expect_redirected_to_category_transactions_page(category)
    expect(page).to have_current_path(category_user_transactions_path(category))
  end

  def click_add_new_category_link
    click_link 'add a new category'
  end

  def expect_redirected_to_new_category_page
    expect(page).to have_current_path(new_category_path)
  end

  def calculate_total_amount(transactions)
    transactions.sum { |t| t[:amount] }
  end
end
