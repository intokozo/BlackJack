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
    @gamers.each { |x| show_player_cards(x) }
    @gamers.each { |x| too_much(x) }
    winning
    puts "Победил игрок #{@winner}"
    report_bank
    @gamers.each(&:zeroing)
  end

  def winning
    @winner = @player.summ > @dealer.summ ? @name : 'диллер'
    case @winner
    when @name
      @dealer.lose
      @player.win
    when 'диллер'
      @dealer.win
      @player.lose
    end
  end

  def report_bank
    puts "У диллера #{@dealer.bank} долларов"
    puts "У игрока #{@name} #{@player.bank} долларов"
  end

  def show_player_cards(gamer)
    naming = gamer == @dealer ? 'диллер' : @name
    puts "У игрока #{naming} на руках #{gamer.current_cards.keys.join(', ')} суммой #{gamer.summ}"
  end

  def show_dealer_stars
    puts 'Карты диллера скрыты'
  end

  def too_much(gamer)
    gamer.summ = 0 if gamer.summ > 21
  end
end
