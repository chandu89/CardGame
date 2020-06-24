module Api
  module V1
    # Card class to work with card details
    class Card < ApplicationRecord
      belongs_to :deck
    end
  end
end
