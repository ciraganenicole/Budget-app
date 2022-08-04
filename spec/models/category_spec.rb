require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'The name should not be empty' do
    Category.first.name = nil
    expect(subject).to_not be_valid
  end

  it 'The icon should not be empty' do
    Category.first.icon = nil
    expect(subject).to_not be_valid
  end

  it 'The user should not be empty' do
    Category.first.user = nil
    expect(subject).to_not be_valid
  end

  it 'The icon should not have a non url only' do
    Category.first.icon = 'my icon to show'
    expect(subject).to_not be_valid
  end
end
