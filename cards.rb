class Cards
  A = 1
  J = 10
  Q = 10
  K = 10
  CARD_SUITS = %w[♤ ♧ ♥ ♦].freeze
  VALUE_CARDS = %w[2 3 4 5 6 7 8 9 10 A J Q K].freeze

  attr_reader :deck

  def initialize
    @deck = {}
    i = 0
    while i < 4
      VALUE_CARDS.each { |x| @deck[x + CARD_SUITS[i]] = eval(x) }
      i += 1
    end
  end
end
