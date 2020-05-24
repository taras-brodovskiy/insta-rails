require 'rails_helper'

RSpec.describe "Users", type: :request do

  let!(:user) do
    create :user
  end

  let!(:user_with_instaposts) do
    create :user_with_instaposts, instaposts_count: 10
  end

  it "is able to reach users page and pass to user page" do    
    get users_path
    expect(response).to have_http_status(:success)
    assert_select 'a[href=?]', user_path(user_with_instaposts)
    get user_path(user_with_instaposts)
    expect(response).to have_http_status(:success)
  end
end
