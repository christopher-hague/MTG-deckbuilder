class Card < ActiveRecord::Base
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  def all_colors
    @card.color.each do |x|
      x
    end
  end

end
