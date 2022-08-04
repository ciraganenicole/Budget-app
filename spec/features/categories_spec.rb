require 'rails_helper'

RSpec.describe 'category', type: :feature do
  before(:each) do
    visit root_path
    click_link 'LOGIN'
    visit new_user_session_path
    fill_in 'Email', with: 'candy@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Login'
    visit categories_path
  end

  it 'get the categories page successfully' do
    expect(page).to have_content 'CATEGORIES'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content '💰'
  end

  it 'to have a button new category' do
    expect(page).to have_content 'ADD NEW CATEGORY'
  end

  it 'should able to sign out' do
    click_button 'Sign out'
    visit root_path
  end

  it 'should be able to create a new category' do
    click_link 'ADD NEW CATEGORY'
    visit new_category_path
  end
end
