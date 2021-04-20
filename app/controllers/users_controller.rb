class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @report = Report.new
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def out
  end
end
