require 'rails_helper'

RSpec.describe User, type: :model do
  it 'the username should not be empty' do
    User.first.name = nil
    User.first.password = '123456'
    expect(subject).to_not be_valid
  end

  it 'The user should be logged in successfully in the system' do
    User.first.password = nil
    expect(subject).to_not be_valid
  end
end
