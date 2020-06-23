class Api::V1::Card
  RANKS = %w(2 3 4 5 6 7 8 9 10 JACK QUEEN KING ACE)
  SUITS = %w(Spades Hearts Clubs Diamonds)

  attr_accessor :rank, :suit

  def initialize(id)
    self.rank = RANKS[id % 13]
    self.suit = SUITS[id % 4]
  end
end