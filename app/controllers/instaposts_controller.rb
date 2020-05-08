class InstapostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :instantiate_user,   except: [:create]

  def show
    @instapost = @user.instaposts.find(params[:id])
    @like = Like.find_by(user: current_user)
  end

  def index    
    @instaposts = @user.instaposts.order(created_at: :desc)
  end

  def new
    @instapost = @user.instaposts.build
  end

  def create
    @instapost = current_user.instaposts.build(instapost_params)
    if @instapost.save
      flash[:notice] = "Instapost created!"
      redirect_to user_instapost_url(current_user, @instapost)
    else
      render 'new'
    end
  end

  private
    def instapost_params
      params.require(:instapost).permit(:caption, :image)
    end

    def instantiate_user
      @user = User.find(params[:user_id])
    end
end
