require "rails_helper"

RSpec.describe User, type: :model do
  let!(:first_user) do
    create(:user)
  end

  let(:second_user) do
    build(:user)
  end

  it "is valid with valid attributes" do
    expect(first_user).to be_valid
  end

  it "isn't valid without a username" do
    first_user.username = " "
    expect(first_user).to_not be_valid
  end

  it "isn't valid with an too long username" do
    first_user.username = "a" * 51
    expect(first_user).to_not be_valid
  end

  it "has a unique username" do
    second_user.username = "First"
    expect(second_user).to_not be_valid
  end

  it "isn't valid without an email" do
    first_user.email = " "
    expect(first_user).to_not be_valid
  end

  it "isn't valid with a too long email" do
    first_user.email = "#{'a' * 250}@a.aaa"
    expect(first_user).to_not be_valid
  end

  it "has a unique email" do
    second_user.username = "Another User"
    expect(second_user).not_to be_valid
  end

  it "has a valid format email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      first_user.email = valid_address
      expect(first_user).to be_valid
    end
  end

  it "hasn't an invalid format email" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      first_user.email = invalid_address
      expect(first_user).to_not be_valid
    end
  end
end
