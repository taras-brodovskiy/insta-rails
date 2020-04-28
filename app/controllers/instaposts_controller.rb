class InstapostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @instapost = Instapost.find(params[:id])
    @user = @instapost.user
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
