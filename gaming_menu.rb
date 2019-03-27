class Gaming
  def initialize
    puts 'Вас приветствует игра Black Jack! Как вас зовут?'
    name = gets.chomp.capitalize
    puts "Приступим к игре, #{name}"
    @dealer = Gamer.new
    @player = Gamer.new
    @cards = Cards.new
    @cards.create_current_deck
    start
  end

  def start
    loop do
      @dealer.take_cards
      @player.take_cards
      menu
      puts "#{name}, хотите продолжить игру?"
      puts '1 - да, 2 - нет'
      break if gets.chomp.to_i == 2
    end
  end

  def menu
    puts "#{name}, что вы хотите делать?"
    puts 'Открыть карты - 1'
    puts 'Взять еще одну - 2'
    gets.chomp.to_i == 1 ? open_cards : player.take_cards(1)
    dealer_move
  end

  def dealer_move
    puts 'Дилер делает свой ход'
    sleep(3)

    if dealer.summ < 17
      dealer.take_cards(1)
      puts 'Дилер берет карту'
    else puts 'Дилер пропускает ход'
    end

    open_cards
  end

  def open_cards
    puts 'У диллера на руках... суммой'
    puts "У игрока #{name} на руках... суммой"
    puts "Победил #{winner}, с суммой"
  end

  def take_one
    player.take_cards(1)
    open_cards
  end
end
