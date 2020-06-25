module Api
  module V1
    # Deck class to work with Deck details
    class Deck
      include ActiveModel::Serializers::JSON
      attr_accessor :cards

      def initialize
        # shuffle array and init each Card
        self.cards = (0..51).to_a.shuffle.collect { |id| Api::V1::Card.new(id) }
      end

      def attributes=(hash)
        hash.each do |key, value|
          send("#{key}=", value)
        end
      end

      def attributes
        instance_values
      end
    end
  end
end
