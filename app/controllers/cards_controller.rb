class CardsController < ApplicationController

  def show
    if logged_in?
      @deck_card = DeckCard.new
      @user = User.find(session[:id])
      @card = Card.find(params[:id])
    else
      session.destroy
      @card = Card.find(params[:id])
    end
  end

  def index
    # @cards = Card.all
    @cards = Card.order(:name).page params[:page]
    # @cards = Card.all.paginate(:page => params[:page], :per_page => 30)
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

  def remove_card
      # debugger
    if @deck_card = DeckCard.find_by(deck_id: (params[:card][:decks]), card_id: params[:id])
      @deck_card = DeckCard.find_by(deck_id: (params[:card][:decks]), card_id: params[:id])
      @deck_card.delete
      flash[:message] = "Deleted from your deck!"
      redirect_to deck_path(params[:card][:decks])
    else
      # debugger
      flash[:message] = "You don't have this in #{Deck.find(params[:card][:decks]).name} deck!"
      redirect_to card_path(params[:id])
    end
  end

  def search_results
    # debugger
    @cards = Card.where("upper(cards.name) like upper(?)", "%#{params[:query]}%")
   flash[:results] = "Here are your results for: #{params[:query]}"
  end

  def search_type
    # debugger
    @cards = Card.where("upper(cards.cardtype) like upper(?)", "%#{params[:query]}%")
   flash[:results] = "Here are your results for: #{params[:query]}"
   render search_result_path
  end

  def search_color
    # debugger
    @cards = Card.where("upper(cards.color) like upper(?)", "%#{params[:query]}%")
   flash[:results] = "Here are your results for: #{params[:query]}"
   render search_result_path
  end


end
