class InstapostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :instantiate_user,   except: [:create]

  def show
    @instapost = @user.instaposts.find(params[:id])
    @like = Like.find_by(user: current_user)
    @comments = @instapost.comments.order(created_at: :desc).paginate(page: params[:page])
    @comment = Comment.new
  end

  def index
    @instaposts = @user.instaposts.order(created_at: :desc).paginate(page: params[:page])
  end

  def new
    @instapost = @user.instaposts.build
  end

  def create
    @user = current_user
    @instapost = @user.instaposts.build(instapost_params)
    if @instapost.save
      flash[:notice] = "Succesful!"
      redirect_to user_instapost_url(current_user, @instapost)
    else
      flash[:alert] = "Unsuccessful!"
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
