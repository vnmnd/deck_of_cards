require_relative "card"

class PlayingDeck
  SUIT = %w(hearts diamonds clubs spades)
  RANK = %w(A 2 3 4 5 6 7 8 9 10 J Q K)

  attr_reader :cards, :used_cards
  
  def initialize
    @used_cards = []
    @cards = []
    SUIT.each do |suit|
      RANK.each do |rank|
        @cards << Card.new(suit, rank)
      end    
    end
  end

  def shuffle! 
    @cards.shuffle!
  end

  def deal(number)
    hand = []
    number.times do 
      card = @cards.shift
      hand << card 
      @used_cards << card  
    end
    hand
  end
end
