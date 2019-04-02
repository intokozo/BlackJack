class Gaming
  attr_reader :name

  def initialize
    @view = View.new
    @view.acquaintance
    @name = gets.chomp.capitalize
    @player = Gamer.new(@name)
    @view.hello(@name)
    @dealer = Gamer.new('дилер')
    @gamers = [@player, @dealer]
    @deck = Deck.new
    start
  end

  def start
    loop do
      @view.start_view(@name)
      break if gets.chomp.to_i == 2
      @gamers.each { |gmr| gmr.take_cards(@deck) }
      @deck.renew_deck
      menu
    end
  end

  def menu
    report_bank
    show_player_cards(@player)
    @view.menu_view(@name)
    @player.take_cards(@deck, 1) if gets.chomp.to_i == 2
    sleep(1)
    dealer_move
    open_cards
  end

  def report_bank
    @gamers.each { |player| @view.report_bank_view(player) }
  end

  def show_player_cards(gamer)
    @gamers.each(&:summ_card)
    @view.show_player_cards_view(gamer)
  end

  def dealer_move
    @view.dealer_move_view
    sleep(1)

    if @dealer.summ < 17
      @dealer.take_cards(@deck, 1)
      @view.dealer_take_card
    else @view.dealer_pass
    end
    sleep(1)
  end

  def open_cards
    @gamers.each { |x| @view.show_player_cards_view(x) }
    @gamers.each { |x| too_much(x) }
    winning
    @winner.nil? ? @view.draw : @view.winner_view(@winner)
    report_bank
    @gamers.each(&:zeroing)
  end

  def too_much(gamer)
    gamer.summ = 0 if gamer.summ > 21
  end

  def winning
    @winner = if @player.summ > @dealer.summ
                @view.name(@name)
              elsif @player.summ < @dealer.summ
                @view.dealer
              elsif @player.summ == @dealer.summ
                nil
              end
    move_bank
    end_lose
  end

  def move_bank
    case @winner
    when @name
      lose(@dealer)
      win(@player)
    when 'дилер'
      win(@dealer)
      lose(@player)
    end
  end

  def end_lose
    if @player.bank_zero?
      @view.lose(@name)
      sleep(1)
      @view.end_thanks
    elsif @dealer.bank_zero?
      @view.win(@name)
      sleep(1)
      @view.end_thanks
    end
  end

  def cur_cards_names(player)
    @view.cur_cards_view(player.names_cards)
  end

  def win(player)
    player.bank += 10
  end

  def lose(player)
    player.bank -= 10
  end
end
