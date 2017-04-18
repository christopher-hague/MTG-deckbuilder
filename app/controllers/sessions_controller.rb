class SessionsController < ApplicationController
  def new

  end


  def create
    #byebug
    @user = User.find_by(name: params["username"])
    if @user.present? && @user.authenticate(params["password"])
      session[:id] = @user.id
      redirect_to users_path # change to decks_path when deckscontroller is completed
    else
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    redirect_to users_path
  end
end

# Start decks,
  # get views functioning
