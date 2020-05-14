class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate_user_and_instapost

  def create
    @comment           = Comment.new
    @comment.user      = @user
    @comment.instapost = @instapost
    @comment.caption   = comment_params[:caption]
    if @comment.save
      flash[:notice] = "Successful!"
    else
      flash[:alert] = "Unsuccessful!"
    end
    redirect_to user_instapost_path(@instapost.user, @instapost)
  end

  private
    def comment_params
      params.require(:comment).permit(:caption)
    end

    def instantiate_user_and_instapost
      @user      = current_user
      @instapost = Instapost.find(params[:instapost_id])
    end
end
