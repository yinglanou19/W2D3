require_relative "card.rb"

class Deck
  attr_accessor :card_deck

  def initialize
    @card_deck = []
    Card.SUIT_ARRAY.each do |suit|
      Card.VALUE_HASH.keys.each do |value|
        @card_deck << Card.new(suit, value)
      end
    end
  end

  def shuffle
    card_deck.shuffle!
  end
end
