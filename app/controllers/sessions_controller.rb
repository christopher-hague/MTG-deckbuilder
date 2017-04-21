class SessionsController < ApplicationController


  def create
    #byebug
    @user = User.find_by(name: params["username"])
    if @user.present? && @user.authenticate(params["password"])
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Incorrect Log In Information"
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    redirect_to home_path
  end
end

# Start decks,
  # get views functioning
