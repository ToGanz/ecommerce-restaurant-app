require 'rails_helper'

RSpec.describe 'delete user', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'is successful' do
    sign_in user
    visit root_path
    click_on 'More Info'

    click_on 'Edit Profile'

    click_on 'Cancel my account'

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end

end