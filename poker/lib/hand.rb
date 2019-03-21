require_relative "card.rb"

class Hand
  attr_reader :hand

  def initialize
    @hand = []
  end

  def add_card(card, *other_cards)
    hand << card
    other_cards.each { |el| hand << el }
    hand
  end

  def remove_card(card, *other_cards)
    hand.delete(card)
    other_cards.each { |el| hand.delete(el) }
    hand
  end
end
