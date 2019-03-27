class Gaming
  def initialize
    puts 'Вас приветствует игра Black Jack! Как вас зовут?'
    @name = gets.chomp.capitalize
    puts "Приступим к игре, #{@name}"
    @dealer = Gamer.new
    @player = Gamer.new
    @cards = Cards.new
    @cards.create_current_deck
    start
  end

  def start
    loop do
      menu
      puts "#{@name}, начнем?"
      puts '1 - да, 2 - нет'
      break if gets.chomp.to_i == 2
    end
  end

  def menu
    puts "#{@name}, что вы хотите делать?"
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
    show_player_cards
    puts "Победил игрок #{winner}, с суммой "
  end

  def winning
    @winner = @player.summ > @dealer.summ ? @name : 'диллер'
  end

  def show_player_cards
    puts "У игрока #{@name} на руках #{@player.current_cards.join(", ")} суммой #{player.summ}"
  end

  def too_much(gamer)
    gamer.summ = 0 if gamer.summ > 21
  end
end
