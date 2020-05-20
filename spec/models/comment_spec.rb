require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:commenter) do
    create(:user_commenter)
  end

  it 'is valid with valid attributes' do
    comment = commenter.comments.first
    expect(comment).to be_valid
  end

  it 'is not valid with a too long caption' do
    comment = commenter.comments.first
    comment.caption = "#{'a' * 1001}"
    expect(comment).to_not be_valid
  end

  it 'can not have blank caption' do
    comment = commenter.comments.first
    comment.caption = ' '
    expect(comment).to_not be_valid
  end
end
