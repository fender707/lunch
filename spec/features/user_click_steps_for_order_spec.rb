require 'spec_helper'

feature 'User visit 3 steps links' do

  before(:each) do
    menu = Menu.create!(title: "Potatoes",description: "Very cool!!!",price: "12",published_on:"2015-08-04", category_id: 1)
    visit new_user_registration_path
    fill_in 'Username',  with:"slava"
    fill_in 'Email',  with:"fender707@rambler.ru"
    fill_in 'Password', with: "zxcvbn78"
    fill_in 'user_password_confirmation', with: "zxcvbn78"
    click_button 'Sign up'
  end

  scenario 'click link First and show menu item' do    
    category = Category.create!(name: "First", id: 1)
    visit root_path
    click_link category.name
    expect(page).to have_content('Potatoes')
  end

  scenario 'click link First and not show menu item' do
    category = Category.create!(name: "First", id: 2)
    visit root_path
    click_link category.name
    expect(page).not_to have_content('Potatoes')
  end

end
