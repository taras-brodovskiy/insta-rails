require 'rails_helper'

RSpec.describe "Instaposts", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/instaposts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/instaposts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/instaposts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/instaposts/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
