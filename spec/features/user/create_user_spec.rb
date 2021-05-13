require 'rails_helper'

RSpec.describe 'create user', type: :feature do
  let(:user) { FactoryBot.build(:user) }

  scenario 'valid inputs' do
    visit root_path
    click_on 'More Info'

    click_on 'Sign up'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_on 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'invalid email' do
    visit signup_path
    fill_in 'user[email]', with: "test.com"
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_on 'Sign up'

    expect(page).to have_content('is invalid')
  end

  scenario 'wrong password' do
    visit signup_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: 'pas'
    click_on 'Sign up'

    expect(page).to have_content("doesn't match Password")
  end
end
