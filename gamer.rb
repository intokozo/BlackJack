class Gamer
  attr_accessor :summ, :bank, :current_cards, :name

  def initialize(name)
    @bank = 100
    @current_cards = []
    @summ = 0
    @@cards = Deck.new
    @name = name
  end

  def zeroing
    @current_cards = []
    @summ = 0
  end

  def take_cards(x = 2)
    deck = @@cards.deck

    x.times do
      random = deck[rand(deck.size)]
      @current_cards << random
      @@cards.remove_card(random)
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
    @current_cards.none?(&:ace?) || @summ > 11 ? @summ : @summ + 10
  end

  def win
    @bank += 10
  end

  def lose
    @bank -= 10
  end

  def bank_zero?
    @bank.zero?
  end

  def deck_nil_zero?
    @@cards.deck.nil? || @@cards.deck.size < 6
  end

  def renew_deck
    @@cards = Deck.new if deck_nil_zero?
  end
end
