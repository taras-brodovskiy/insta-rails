class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @instaposts = @user.feed_instaposts
  end

  def index
    @users = User.all
  end

  def followers
    @title = "Followers"
    @users = User.find(params[:id]).followers
    render 'follows'
  end

  def following
    @title = "Following"
    @users = User.find(params[:id]).following
    render 'follows'
  end
end
