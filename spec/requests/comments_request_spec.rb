require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) do
    create :user
  end

  let(:user_with_instaposts) do
    create :user_with_instaposts, instaposts_count: 10
  end

  it 'is able to create valid comment' do
    sign_in user
    get user_instapost_path(user_with_instaposts, user_with_instaposts.instaposts.first)
    expect(response).to render_template(:show)
    
    # Invalid try
    post user_instapost_comments_path(user_with_instaposts, user_with_instaposts.instaposts.first), params: { comment: { caption: '' } }
    expect(flash[:alert]).to eq('Unsuccessful!')
    follow_redirect!

    #Valid try
    post user_instapost_comments_path(user_with_instaposts, user_with_instaposts.instaposts.first), params: { comment: { caption: 'Caption' } }
    expect(flash[:notice]).to eq('Successful!')
    follow_redirect!
    assert_select 'div', 'Caption'
  end
end
