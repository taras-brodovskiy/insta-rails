require 'rails_helper'

RSpec.describe Instapost, type: :model do
  let(:author) do
    create(:user_with_instaposts)
  end

  it "is valid with valid attributes" do
    instapost = author.instaposts.first
    expect(instapost).to be_valid
  end

  it "isn't valid with a too long caption" do
    instapost = author.instaposts.first
    instapost.caption = "#{'a' * 1001}"
    expect(instapost).to_not be_valid
  end
end
