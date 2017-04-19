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

  def search
    @cards = Card.where(name: params[:query])
    # debugger
    flash[:results] = "Here are your results"
    render :index
  end



  # private
  #
  # def sorted_by
  #   <% @cards.sort_by{ |card| card.name}.each do |card|  %>
  #     <li><%= link_to card.name, card_path(card) %></li>
  #   <% end.sort %>
  # end

end
