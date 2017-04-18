class DeckcardsController < ApplicationController

  def add_to_deck
    @card = Card.find(params[:id])

  end

end
