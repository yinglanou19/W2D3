class Card
  SUIT_ARRAY = %w(diamond club heart spade).freeze
  VALUE_HASH = {
    1 => "ace", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six",
    7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "jack",
    12 => "queen", 13 => "king",
  }.freeze
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{VALUE_HASH[value]} of #{suit}"
  end

  def ==(card)
    suit == card.suit && value == card.value
  end

  def self.SUIT_ARRAY
    SUIT_ARRAY
  end

  def self.VALUE_HASH
    VALUE_HASH
  end
end
