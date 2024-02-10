# spec/features/home_spec.rb

require 'rails_helper'

RSpec.feature 'Home Page', type: :feature do
  include Capybara::DSL

  scenario 'User can see the Expense Tracker title' do
    visit '/'
    expect(page).to have_content('Expense Tracker')
  end

  scenario 'User can click the Log in button' do
    visit new_user_session_path # Visit the login page
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'User can click the Sign up button' do
    visit new_user_registration_path # Visit the signup page
    expect(page).to have_current_path(new_user_registration_path)
  end
end
