
# I want to test if the deck has all four suits:
# clubs (C), diamonds (D), hearts (H), spades (S)
# Each suit has 14 cards:
# A, K, Q, J, 10, 9, 8, 7, 6, 5, 4, 3, 2

class Card
  attr_reader :suit, :rank 

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
end

# Struct.new("Card", :suit, :rank)
