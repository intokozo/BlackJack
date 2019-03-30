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
    @current_cards.each_value { |x| @summ += x }
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
end
