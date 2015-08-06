require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid data' do
    sign_in_with 'slava','fender707@rambler.ru', 'password', 'password'

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    sign_in_with 'slava','invalid_email', 'password', 'password'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_in_with 'slava','invalid_email', '', ''

    expect(page).to have_content('Sign up')
  end

  def sign_in_with( username, email, password, password_confirmation)
    visit new_user_registration_path
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password 
    fill_in 'user_password_confirmation', with: password_confirmation
    click_button 'Sign up'
  end
end
