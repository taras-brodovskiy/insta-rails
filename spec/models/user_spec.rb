require 'rails_helper'

RSpec.describe User, type: :model do
  let(:permanent_user) do
    create(:user)
  end

  let(:temporary_user) do
    build(:user)
  end

  it 'is valid with valid attributes' do
    expect(permanent_user).to be_valid
  end

  it 'is not valid without a username' do
    permanent_user.username = ' '
    expect(permanent_user).to_not be_valid
  end

  it 'is not valid with an too long username' do
    permanent_user.username = 'a' * 51
    expect(permanent_user).to_not be_valid
  end

  it 'has a unique username' do  
    temporary_user.username  = permanent_user.username
    expect(temporary_user).to_not be_valid
  end

  it 'is not valid without an email' do
    permanent_user.email = ' '
    expect(permanent_user).to_not be_valid
  end

  it 'is not valid with a too long email' do
    permanent_user.email = "#{'a' * 250}@a.aaa"
    expect(permanent_user).to_not be_valid
  end

  it 'has a unique email' do
    temporary_user.email  = permanent_user.email
    expect(temporary_user).not_to be_valid
  end

  it 'has a valid format email' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      permanent_user.email = valid_address
      expect(permanent_user).to be_valid
    end
  end

  it 'has not an invalid format email' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      permanent_user.email = invalid_address
      expect(permanent_user).to_not be_valid
    end
  end
end
