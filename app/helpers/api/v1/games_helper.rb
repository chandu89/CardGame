# frozen_string_literal: true

module Api
  module V1
    # This helper is used by game controller and model need basis
    module GamesHelper
      RANKS = %w[ACE 2 3 4 5 6 7 8 9 10 JACK QUEEN KING].freeze
      SUITS = %w[Spades Diamonds Hearts Clubs].freeze

      def compare_and_return_card(cards)
        suit1 = cards.first.downcase.delete('of').split(' ').last
        suit2 = cards.last.downcase.delete('of').split(' ').last
        if SUITS.index(suit1.capitalize) > SUITS.index(suit2.capitalize)
          cards.first
        elsif SUITS.index(suit1.capitalize) < SUITS.index(suit2.capitalize)
          cards.last
        else
          rank1 = cards.first.downcase.delete('of').split(' ').first
          rank2 = cards.last.downcase.delete('of').split(' ').first
          if RANKS.index(rank1.upcase) > RANKS.index(rank2.upcase)
            cards.first
          elsif RANKS.index(rank1.upcase) < RANKS.index(rank2.upcase)
            cards.last
          else
            'Both Cards are equal'
          end
        end
      end
    end
  end
end
