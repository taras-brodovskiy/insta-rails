require 'rails_helper'

RSpec.describe "Auths", type: :request do
=begin
  it "allows to register and log into account" do
    get new_user_registration_url
    expect(response).to render_template(:new)
    post user_registration_url, params: { username:              "Test", 
                                          email:                 "test@test.ru",
                                          password:              "foobar",
                                          password_confirmation: "foobar" }
    follow_redirect!
    expect(response).to render_template(:home)
    expect(response.body).to include("Welcome! You have signed up successfully.")
  end
=end
end
