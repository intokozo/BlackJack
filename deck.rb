class Deck
  attr_reader :deck

  CARD_SUITS = %w[♤ ♧ ♥ ♦].freeze
  MEAN_CARDS = (2..10).to_a + %w[A J Q K]

  def initialize
    create_deck
  end

  def create_deck
    CARD_SUITS.each.with_object([]) do |suit, deck|
      MEAN_CARDS.each { |mean| deck << Card.new(suit, mean) }
      @deck = deck
    end.shuffle!
  end

  def remove_card(card)
    @deck.delete(card)
  end

  def deck_nil_zero?
    @deck.nil? || @deck.size < 6
  end

  def renew_deck
    create_deck if deck_nil_zero?
  end
end
