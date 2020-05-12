class LikesController < ApplicationController
  before_action :authenticate_user!  
  before_action :instantiate_user_and_instapost

  def create
    @like = Like.new
    @like.user = @user
    @like.instapost = @instapost
    @like.save
    respond_to do |format|
      format.html { redirect_to user_instapost_path(@instapost.user, @instapost) }
      format.js
    end
  end

  def destroy
    @like = Like.find_by(user: @user, instapost: @instapost)
    @like.delete
    respond_to do |format|
      format.html { redirect_to user_instapost_path(@instapost.user, @instapost) }
      format.js
    end
  end

  private
    def instantiate_user_and_instapost
      @user = current_user
      @instapost = Instapost.find(params[:instapost_id])
    end
end
