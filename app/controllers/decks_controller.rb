class DecksController < ApplicationController
  def new
    if logged_in?
      @deck = Deck.new
    else
      flash[:notice] = "You have to be logged in to do that."
      redirect_to login_path
    end
  end

  def create
    # debugger
    @deck = Deck.new(user_id: session[:id], name: params[:deck][:name])
    if @deck.save
      redirect_to user_path(session[:id])
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:id])
    @deck = Deck.find(params[:id])
    # debugger
  end

  def update
    # debugger
  end


end
