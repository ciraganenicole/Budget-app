require 'rails_helper'

RSpec.describe 'login', type: :feature do
  before(:each) do
    visit root_path
    click_link 'LOGIN'
    visit new_user_session_path
    fill_in 'Email', with: 'candy@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Login'
    visit categories_path
  end

  it 'login successfully' do
    expect(page).to have_content 'CATEGORIES'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content '💰'
  end

  it 'login unsuccessfully' do
    click_button 'Sign out'
    visit new_user_session_path
    fill_in 'Email', with: 'ee@gmail.com'
    fill_in 'Password', with: '12345'
    click_button 'Login'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'logout successfully' do
    click_button 'Sign out'
    visit root_path
    expect(page).to have_content 'LOGIN'
    expect(page).to have_content 'SIGNUP'
  end
end
