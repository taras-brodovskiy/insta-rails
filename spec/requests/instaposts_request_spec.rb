require 'rails_helper'

RSpec.describe 'Instaposts', type: :request do
  let!(:user) do
    create :user
  end

  let(:user_with_instaposts) do
    create :user_with_instaposts, instaposts_count: 10
  end

  before :each do
    sign_in user
  end

  after :each do
    sign_out user
  end

  it 'is able to create valid instapost' do
    get new_user_instapost_path(user)
    expect(response).to render_template(:new)
    
    # Invalid try
    post user_instaposts_path, params: { instapost: { caption: '' } }
    # assert_equal 'Unsuccessful!', flash[:alert]
    expect(flash[:alert]).to eq('Unsuccessful!')

    #Valid try
    post user_instaposts_path, params: { instapost: { caption: 'Caption' } }
    expect(response).to redirect_to(user_instapost_url(user, assigns(:instapost)))
  end

  it 'is able to get instapost index and pass to particular instapost' do
    get user_instaposts_path(user_with_instaposts)
    expect(response).to render_template(:index)
    get user_instapost_path(user_with_instaposts, user_with_instaposts.instaposts.first)
    expect(response).to render_template(:show)
  end
end
