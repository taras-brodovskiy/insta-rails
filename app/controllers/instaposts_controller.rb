class InstapostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:user_id])
    @instapost = @user.instaposts.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])    
    @instaposts = @user.instaposts
  end

  def new
    @instapost = Instapost.new
  end

  def create
    @instapost = current_user.instaposts.build(instapost_params)
    if @instapost.save
      flash[:success] = "Instapost created!"
      redirect_to @instapost
    else
      render 'new'
    end
  end

  private
    def instapost_params
      params.require(:instapost).permit(:caption, :image)
    end
end
