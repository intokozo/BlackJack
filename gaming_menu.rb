class Gaming
  attr_reader :cards

  def initialize
    puts 'Игра Black Jack! Как вас зовут?'
    @name = gets.chomp.capitalize
    puts "Приветствую вас, #{@name}"
    @dealer = Gamer.new
    @player = Gamer.new
    @gamers = [@dealer, @player]
    start
  end

  def start
    loop do
      puts "#{@name}, сыграем?"
      puts '1 - да, 2 - нет'
      break if gets.chomp.to_i == 2
      @gamers.each(&:take_cards)
      @player.renew_deck
      menu
    end
  end

  def menu
    report_bank
    show_player_cards(@player)
    show_dealer_stars
    puts "#{@name}, что вы хотите делать?"
    puts 'Открыть карты - 1'
    puts 'Взять еще одну - 2'
    @player.take_cards(1) if gets.chomp.to_i == 2
    sleep(1)
    dealer_move
    open_cards
  end

  def dealer_move
    puts 'Дилер делает свой ход'
    sleep(3)

    if @dealer.summ < 17
      @dealer.take_cards(1)
      puts 'Дилер берет карту'
    else puts 'Дилер пропускает ход'
    end
    sleep(1)
  end

  def open_cards
    sleep(1)
    @gamers.each { |x| show_player_cards(x) }
    @gamers.each { |x| too_much(x) }
    winning
    puts @winner.nil? ? 'Ничья' : "Победил игрок #{@winner}\n"
    report_bank
    @gamers.each(&:zeroing)
  end

  def winning
    @winner = if @player.summ > @dealer.summ
                @name
              elsif @player.summ < @dealer.summ
                'диллер'
              elsif @player.summ == @dealer.summ
                nil
              end
    move_bank
    end_lose
  end

  def move_bank
    case @winner
    when @name
      @dealer.lose
      @player.win
    when 'диллер'
      @dealer.win
      @player.lose
    end
  end

  def end_lose
    if @player.bank_zero?
      puts "Игрок #{@name} проиграл."
      sleep(5)
      abort 'Спасибо за игру'
    elsif @dealer.bank_zero?
      puts "Игрок #{@name} победил!!"
      sleep(5)
      abort 'Спасибо за игру'
    end
  end

  def report_bank
    puts "У диллера #{@dealer.bank} долларов"
    puts "У игрока #{@name} #{@player.bank} долларов\n"
  end

  def show_player_cards(gamer)
    @gamers.each(&:summ_card)
    naming = gamer == @dealer ? 'диллер' : @name
    puts "У игрока #{naming} на руках #{gamer.current_cards.keys.join(', ')} суммой #{gamer.summ}\n"
  end

  def show_dealer_stars
    puts "Карты диллера скрыты\n"
  end

  def too_much(gamer)
    gamer.summ = 0 if gamer.summ > 21
  end
end
