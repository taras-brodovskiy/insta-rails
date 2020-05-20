require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:liker) do
    create(:user_liker)
  end

  it 'is valid with valid attributes' do
    like = liker.likes.first
    expect(like).to be_valid
  end
end
