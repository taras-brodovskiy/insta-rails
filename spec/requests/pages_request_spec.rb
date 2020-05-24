require 'rails_helper'

RSpec.describe "Pages", type: :request do
    it "is able to reach home page" do
      get root_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:home)
      assert_select "a[href=?]", root_path
      assert_select "a[href=?]", new_user_registration_path
    end
end
