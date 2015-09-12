require "spec_helper"
require "deck"

describe "Deck" do
  before(:each) do
    @deck = PlayingDeck.new
  end

  it "has cards" do
    @deck.cards.size.must_equal 52
  end

  it "has 4 suits" do 
    @deck.cards.map{ |card| card.suit }.uniq.size.must_equal 4
  end

  it "has 13 ranks" do 
    @deck.cards.map{ |card| card.rank }.uniq.size.must_equal 13
  end

  it "can be shuffled" do 
    @deck.shuffle!
    card = @deck.cards.first
    (card.rank == "A" && card.suit == "hearts").wont_equal true 
  end

  it "deals the right amount of cards" do
    @deck.deal(7).size.must_equal 7
  end

  it "removes cards from deck" do
    @deck.deal(7)
    @deck.cards.size.must_equal (52 - 7)
  end

  it "checks that number of used cards is correct" do
    2.times{ @deck.deal(7) }
    @deck.used_cards.size.must_equal (2 * 7)
  end

  it "checks from hand that deck has been shuffled" do
    @deck.shuffle!
    hand = @deck.deal(7)
    (hand[0].rank != 'A' && hand[0].suit != 'hearts' &&
     hand[1].rank != '2' && hand[1].suit != 'hearts' &&
     hand[2].rank != '3' && hand[2].suit != 'hearts' &&
     hand[3].rank != '4' && hand[3].suit != 'hearts' &&
     hand[4].rank != '5' && hand[4].suit != 'hearts' &&
     hand[5].rank != '6' && hand[5].suit != 'hearts' &&
     hand[6].rank != '7' && hand[6].suit != 'hearts')
  end
end
