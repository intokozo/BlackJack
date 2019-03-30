class Gamer
  attr_accessor :summ, :bank, :current_cards

  def initialize
    @bank = 100
    @current_cards = {}
    @summ = 0
    @@cards = Cards.new
  end

  def zeroing
    @current_cards = {}
    @summ = 0
  end

  def take_cards(x = 2)
    keys = @@cards.deck.keys

    x.times do
      random = keys[rand(keys.size)]
      @current_cards.store(random, @@cards.deck[random])
      @@cards.deck.delete(random)
    end

    summ_card
  end

  def summ_card
    a = @summ
    @current_cards.each_value { |x| @summ += x }
    @summ -= a
    ace_miracle
  end

  def ace_miracle
    @summ += 10 if @current_cards.each_key { |x| x =~ /^A/ } && (@summ < 12)
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
    @@cards = Cards.new if deck_nil_zero?
  end
end
