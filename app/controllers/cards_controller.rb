class CardsController < ApplicationController

  def show
    if logged_in?
      @user = User.find(session[:id])
      @card = Card.find(params[:id])
    else
      @card = Card.find(params[:id])
    end
  end

  def index
    @cards = Card.all
  end

  def deck
    @edit_deck = DeckCard.new(card_id: params[:id], deck_id: params[:card][:decks])
    if @edit_deck.save
      flash[:message] = "Saved to your deck!"
      redirect_to "/decks/#{params[:card][:decks]}"
    else
      redirect_to cards_path
    end
  end

end
