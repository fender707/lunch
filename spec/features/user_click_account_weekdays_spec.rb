require 'spec_helper'

feature 'User visit Account link' do


  before(:each) do
    visit new_user_registration_path
    fill_in 'Username',  with:"slava"
    fill_in 'Email',  with:"fender707@rambler.ru"
    fill_in 'Password', with: "zxcvbn78"
    fill_in 'user_password_confirmation', with: "zxcvbn78"
    click_button 'Sign up'
  end

  scenario 'click Account' do
    visit root_path
    click_link "Account"
    expect(page).to have_content('Edit User')
  end

  scenario 'click account and back' do
    visit root_path
    click_link "Account"
    click_link "Back"
    expect(page).to have_content('Menu')
  end

  scenario 'click link 2 days ago and see menu item' do
    menu = Menu.create!(title: "Potatoes",description: "Very cool!!!",price: "12",published_on:"2015-08-04", created_at: 2.days.ago)
    visit root_path
    click_link 2.days.ago.to_time.strftime('%B%e')
    expect(page).to have_content('Potatoes')
  end

  scenario 'click link 2 days ago and not see menu item' do
    menu = Menu.create!(title: "Potatoes",description: "Very cool!!!",price: "12",published_on:"2015-08-04", created_at: 3.days.ago)
    visit root_path
    click_link 2.days.ago.to_time.strftime('%B%e')
    expect(page).not_to have_content('Potatoes')
  end

end
