class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @report = Report.new
  end

  def show
    @user = User.find(params[:id])
    @report_ = Report.all.sum(:time)

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
