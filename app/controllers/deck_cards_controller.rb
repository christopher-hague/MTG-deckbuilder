class DeckCardsController < ApplicationController

  def create
    @deck_card = DeckCard.new(deck_card_params)

    if @deck_card.valid?
      params[:quantity].to_i.times do
        DeckCard.create(deck_card_params)
      end
      redirect_to @deck_card.deck
    else
      render 'cards/show'
    end
  end


  private

  def deck_card_params
    params.require(:deck_card).permit(:card_id, :deck_id)
  end
end
