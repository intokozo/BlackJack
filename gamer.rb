class Gamer
  attr_accessor :summ, :bank, :current_cards, :name

  def initialize(name)
    @bank = 100
    @current_cards = []
    @summ = 0
    @name = name
  end

  def zeroing
    @current_cards = []
    @summ = 0
  end

  def take_cards(deck, x = 2)
    cards = deck.deck
    x.times do
      random = cards[rand(cards.size)]
      @current_cards << random
      deck.remove_card(random)
    end

    summ_card
  end

  def summ_card
    a = @summ
    @current_cards.each { |card| @summ += card.value }
    @summ -= a
    ace_miracle
  end

  def ace_miracle
    @current_cards.none?(&:ace?) || @summ > 12 ? @summ : @summ += 10
  end

  def bank_zero?
    @bank.zero?
  end

  def names_cards
    cards = []
    @current_cards.each { |card| cards << card.name }
    cards
  end
end
