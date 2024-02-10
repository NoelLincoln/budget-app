require 'rails_helper'

RSpec.feature 'Categories Index Page', type: :feature do
  scenario 'User can see category names and total amounts' do
    # Create a user
    user = create(:user)

    user.confirm

    # Log in as the user
    sign_in(user)

    # Create some categories associated with the user
    category1 = create(:category, name: 'Category 1', user: user, icon: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test.png'), 'image/png'))
    category2 = create(:category, name: 'Category 2', user: user, icon: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test.png'), 'image/png'))

    # Create user transactions for each category
    create(:user_transaction, name: 'Transaction 1', amount: 100, category: category1, author: user)
    create(:user_transaction, name: 'Transaction 2', amount: 200, category: category1, author: user)
    create(:user_transaction, name: 'Transaction 3', amount: 150, category: category2, author: user)

    # Visit the categories index page
    visit categories_path

    # Assert that the page contains the category names and total amounts
    expect(page).to have_content('Category 1')
    expect(page).to have_content('$300')
    expect(page).to have_content('Category 2')
    expect(page).to have_content('$150')
  end

  scenario 'User can click on a category to view its transactions' do
    # Create a user
    user = create(:user)

    # Confirm the user's account (simulate email confirmation)
    user.confirm

    # Log in as the user
    login_as(user, scope: :user)

    # Create a category associated with the user
    category = create(:category, name: 'Category 1', user: user, icon: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'images', 'test.png'), 'image/png'))

    # Visit the categories index page
    visit categories_path

    # Debugging: Print the actual path
    puts current_path

    # Add authorization check
    # Assuming you have an Ability class (usually in ability.rb) that defines permissions
    # for reading transactions, you can mock the authorize! method like this:
    allow_any_instance_of(Ability).to receive(:authorize!).with(:read, UserTransaction)

    # Click on the entire card (including link)
    # find('.card').click
    click_link 'Category 1'

    # Assert that the user is redirected to the category's transactions page
    expect(page).to have_current_path(category_user_transactions_path(category))
  end

  scenario 'User can add a new category' do
    # Create a user
    user = create(:user)

    user.confirm

    # Log in as the user
    login_as(user, scope: :user)

    # Visit the categories index page
    visit categories_path

    # Click on the "Add a new category" link
    click_link 'add a new category'

    # Assert that the user is redirected to the new category page
    expect(page).to have_current_path(new_category_path)
  end
end
