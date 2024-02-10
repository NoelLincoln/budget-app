require 'rails_helper'

RSpec.feature 'Categories Index Page - Viewing Transactions', type: :feature do
  scenario 'User can view category transactions' do
    user = create_and_sign_in_user
    category = create_category_for_user(user)
    visit_categories_index_page
    click_category_link(category)
    expect_redirected_to_category_transactions_page(category)
  end

  private

  def create_and_sign_in_user
    user = create(:user).tap(&:confirm)
    sign_in(user)
    user
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
end

RSpec.feature 'Categories Index Page - Adding Category', type: :feature do
  scenario 'User can add a new category' do
    create_and_sign_in_user
    visit_categories_index_page
    click_add_new_category_link
    expect_redirected_to_new_category_page
  end

  private

  def create_and_sign_in_user
    user = create(:user).tap(&:confirm)
    sign_in(user)
    user
  end

  def visit_categories_index_page
    visit categories_path
  end

  def click_add_new_category_link
    click_link 'add a new category'
  end

  def expect_redirected_to_new_category_page
    expect(page).to have_current_path(new_category_path)
  end
end
