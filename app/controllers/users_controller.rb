class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @instaposts = @user.feed_instaposts.paginate(page: params[:page])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def followers
    @title = "Followers"
    @users = User.find(params[:id]).followers.paginate(page: params[:page])
    render 'follows'
  end

  def following
    @title = "Following"
    @users = User.find(params[:id]).following.paginate(page: params[:page])
    render 'follows'
  end
end
