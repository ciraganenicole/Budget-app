require 'rails_helper'

RSpec.describe 'category', type: :feature do
  before(:each) do
    visit root_path
    click_link 'LOGIN'
    visit new_user_session_path
    fill_in 'Email', with: 'candy@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Login'
    visit category_transancts_path Category.first
  end

  it 'get the Transanctions page successfully' do
    expect(page).to have_content 'Transanctions'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content '💰'
  end

  it 'to have a button new transanction' do
    expect(page).to have_content 'ADD NEW TRANSANCTION'
  end

  it 'should able to sign out' do
    click_button 'Sign out'
    visit root_path
  end

  it 'should be able to create a new transanction' do
    click_link 'ADD NEW TRANSANCTION'
    visit new_category_transanct_path Category.second
  end

  it 'should return a message if the tranctions table is empty' do
    visit category_transancts_path Category.second
    expect(page).to have_content 'No transactions created yet'
  end

  it 'should have Total transactions' do
    visit category_transancts_path Category.first
    expect(page).to have_content 'Total amount'
  end
end
