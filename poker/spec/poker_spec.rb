require "rspec"
require "card"
require "deck"
require "hand"

RSpec.describe Card do
  subject(:diamond_seven) { Card.new("diamond", 7) }
  describe "#initialize" do
    it "should initialize a card with suit" do
      expect(diamond_seven.suit).to eq("diamond")
    end
    it "should initialize a card with value" do
      expect(diamond_seven.value).to eq(7)
    end
  end

  describe "#to_s" do
    it "should print the card properly" do
      expect(diamond_seven.to_s).to eq("seven of diamond")
    end
  end
end

RSpec.describe Deck do
  subject(:deck) { Deck.new }
  let(:diamond_seven) { Card.new("diamond", 7) }
  describe "#initialize" do
    it "should create a deck" do
      expect(deck.card_deck).to include(diamond_seven)
    end
  end
  describe "#shuffle" do
    it "shuffle the deck properly" do
      before = deck.card_deck[0]
      deck.shuffle
      expect(deck.card_deck[0]).to_not eq(before)
      expect(deck.card_deck).to include(before)
    end
  end
end

RSpec.describe Hand do
  subject(:hand) { Hand.new }
  describe "#initialize" do
    it "should create an empty array" do
      expect(hand.hand).to be_empty
    end
  end
  describe "#add_card" do
    it "accepts an array of cards"
    it "accept a single card"
  end
  describe "#remove_card" do
    it "remove a single card from hand"
    it "remove cards from hand"
    it "doesn't modify hand if input is not in hand"
  end
  describe "#is_three_of_a_kind?" do
    it "should return true if hand is a three of a kind"
    it "should return false if hand is not a three of a kind"
  end

  describe "#is_pair?" do
    it "should return true if hand is a pair"
    it "should return false if hand is a two-pair"
    it "should return false if hand is not a pair"
  end
  describe "#is_straight?" do
    it "should return true if hand is straight"
    it "should return false if hand is not straight"
  end

  describe "#is_flush?" do
    it "should return true if hand is flush"
    it "should return false if hand is not flush"
  end

  describe "#is_four_of_a_kind?" do
    it "should return true if hand is four of a kind"
    it "should return false if hand is not four of a kind"
  end
end
