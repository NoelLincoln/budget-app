require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  before do
    user.confirm
    login_as(user, scope: :user)
  end

  context 'New Category Form' do
    scenario 'User can create a new category' do
      visit new_category_path
      puts page.html

      fill_in 'Name', with: 'Test Category'
      attach_file 'Icon', Rails.root.join('spec', 'fixtures', 'test.png')

      click_button 'Save Category'

      expect(page).to have_text('Category was successfully created.')
      expect(page).to have_current_path(categories_path)
    end

    scenario 'User can go back to categories index page' do
      visit new_category_path

      click_link 'Back'

      expect(page).to have_current_path(categories_path)
    end
  end
end
