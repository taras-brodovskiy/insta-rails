require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let!(:user) do
    create :user
  end

  let!(:user_with_instaposts) do
    create :user_with_instaposts, instaposts_count: 10
  end

  it 'is able to follow user and receive his instaposts on your feed' do
    sign_in user
    get user_path(user_with_instaposts)
    expect(user.feed_instaposts.size).to be == 0
    post relationships_path, params: { followed_id: user_with_instaposts.id }
    expect(response).to have_http_status(:redirect)
    follow_redirect!
    get user_path(user)
    expect(user.feed_instaposts.size).to be > 0
  end
end
