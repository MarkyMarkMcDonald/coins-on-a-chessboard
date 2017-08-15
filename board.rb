class Board
  attr_accessor :value

  def initialize(value:, size:)
    @value = value
    @size = size
  end

  def next_boards
    moves = to_s.chars.reverse.map.with_index do |coin, index|
      direction = coin === '1' ? -1 : 1
      (2 ** index) * direction
    end
    moves.map do |move|
      Board.new(value: @value + move, size: @size)
    end
  end

  def to_s
    @value.to_s(2).rjust(@size, '0')
  end
end