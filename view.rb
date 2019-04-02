class View
  def acquaintance
    puts 'Игра Black Jack! Как вас зовут?'
  end

  def hello(name)
    puts "Приветствую вас, #{name}"
  end

  def start_view(name)
    puts "#{name}, сыграем?"
    puts '1 - да, 2 - нет'
  end

  def menu_view(name)
    show_dealer_stars
    puts "#{name}, что вы хотите делать?"
    puts 'Открыть карты - 1'
    puts 'Взять еще одну - 2'
  end

  def report_bank_view(player)
    puts "У игрока #{player.name} #{player.bank} долларов\n"
  end

  def show_player_cards_view(gamer)
    cards = cur_cards_view(gamer.names_cards)
    puts "У игрока #{gamer.name} на руках #{cards} суммой #{gamer.summ}\n"
  end

  def dealer_move_view
    puts "Дилер делает свой ход\n"
  end

  def dealer_take_card
    puts 'Дилер берет карту'
  end

  def dealer_pass
    puts 'Дилер пропускает ход'
  end

  def dealer
    'дилер'
  end

  def name(name)
    name
  end

  def winner_view(winner)
    puts "Победил игрок #{winner}\n"
  end

  def draw
    puts 'Ничья'
  end

  def lose(name)
    puts "Игрок #{name} проиграл."
  end

  def win(name)
    puts "Игрок #{name} победил!!"
  end

  def end_thanks
    abort 'Спасибо за игру'
  end

  def cur_cards_view(cards)
    cards.join(', ')
  end

  def show_dealer_stars
    puts "Карты диллера скрыты\n"
  end
end
