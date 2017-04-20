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
    @deck = Deck.find(params[:id])

    # debugger
  end

  def delete_card

  end

  def sample_hand
    @deck = Deck.find(params[:id])
    @shuffled_deck = Deck.find(params[:id])
    @sample = @shuffled_deck.cards.map {|card| card.image_url}.shuffle[0..6]
    render :show
  end

  def delete
    @deck = Deck.find(params[:id])
    @deck.delete
    redirect_to user_path(session[:id])
  end


end
