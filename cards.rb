class Card
  def initialize(suit, mean)
    @suite = suit
    @mean = mean
  end

  def ace?
    @mean == 'A'
  end

  def name
    @mean.to_s + @suite
  end

  def value
    return @mean if @mean.is_a?(Integer)

    ace? ? 1 : 10
  end
end
