class Gamer
  attr_reader :bank, :current_cards, :summ

  def initialize
    @bank = 100
    @current_cards = []
    @summ = 0
    take_cards
  end

  def take_cards(x = 2)
    keys = cards.current_deck.keys
    x.times { @current_cards << keys[rand(keys.size)] }
    # Удалить из курент плэй кардс карты которые взяли
  end

  def summ_card
    @summ = @current_cards.each { |x| @summ += @deck[x] }
    ace_miracle
  end

  def ace_miracle
    @summ += 10 if @current_cards.each_key { |x| /A^/ =~ x } && @summ <= 11 #Нужен правильный regx
  end
end
