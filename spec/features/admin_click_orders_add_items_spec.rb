require 'spec_helper'

feature 'Admin visit different pages' do

  scenario 'admin visit root page' do
    sign_in
    visit root_path
    expect(page).to have_content('Hello, Admin')
  end

  scenario 'admin visit Orders link' do
    sign_in
    visit root_path
    click_link "Orders"
    expect(page).to have_content('Listing orders')
  end

  scenario 'admin visit Add Items link' do
    sign_in
    visit root_path
    click_link "Add Items"
    expect(page).to have_content('Menus')
  end

  scenario 'admin visit Users link' do
    sign_in
    visit root_path
    click_link "Users"
    expect(page).to have_content('Listing users')
  end

  def sign_in
    user = User.create!(username: "Slava", email: "fender707@rambler.ru",admin: true, password: "password")
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
