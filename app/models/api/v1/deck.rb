class Api::V1::Deck

  attr_accessor :cards
  def initialize
    # shuffle array and init each Card
    self.cards = (0..51).to_a.shuffle.collect { |id| Api::V1::Card.new(id) }
  end
end