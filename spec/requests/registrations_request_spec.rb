require 'rails_helper'

RSpec.describe "Auths", type: :request do
  it "allows to register and log into account" do
    get new_user_registration_url
    expect(response).to render_template(:new)
    post user_registration_url, params: { 
                                         user: {
                                                username:              "Test", 
                                                email:                 "test@test.com",
                                                password:              "foobar",
                                                password_confirmation: "foobar" 
                                                }
                                         }
    follow_redirect!
    follow_redirect!
    expect(response).to render_template('users/show')
    expect(response.body).to include("Welcome! You have signed up successfully.")
  end
end
