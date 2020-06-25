module Api
  module V1
    # Card class to work with card details
    class Card
      RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
      SUITS = %w[Spade Heart Club Diamond].freeze

      attr_accessor :rank, :suit

      def initialize(id)
        self.rank = RANKS[id % 13]
        self.suit = SUITS[id % 4]
      end
    end
  end
end
