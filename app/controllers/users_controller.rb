class UsersController < ApplicationController

  def home

  end

  def show
    @user = User.find(params[:id])
    # byebug
  end

  def index
    @users = User.all
  end

  def new
    # debugger
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def edit
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to login_path
    end
    # debugger
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    # debugger
    @user.destroy
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
