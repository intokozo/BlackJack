class Deck
  attr_reader :deck

  CARD_SUITS = %w[♤ ♧ ♥ ♦].freeze
  MEAN_CARDS = (2..10).to_a + %w[A J Q K]

  def initialize
    @deck = []
    CARD_SUITS.each do |suit|
      MEAN_CARDS.each { |mean| @deck << Card.new(suit, mean) }
    end
    @deck.shuffle!
  end

  def remove_card(card)
    @deck.delete(card)
  end
end
