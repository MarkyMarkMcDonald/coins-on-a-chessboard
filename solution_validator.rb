class Board
  attr_accessor :value

  def initialize(value:, spaces:)
    @value = value
    @spaces = spaces
  end

  def possible_moves
    to_s.chars.reverse.map.with_index do |coin, index|
      direction = coin === '1' ? -1 : 1
      (2 ** index) * direction
    end
  end

  def to_s
    @value.to_s(2).rjust(@spaces, '0')
  end
end

class SolutionValidator
  def initialize(board_length:)
    @board_length = board_length
  end

  def solve(solution)
    possible_boards.all? do |board|
      check(board, solution)
    end
  end

  private

  def possible_boards
    (0..(2**@board_length - 1)).map do |board_values|
      Board.new(value: board_values, spaces: @board_length)
    end
  end

  def check(board, solution)
    boards_with_moves = board.possible_moves.map do |move|
      Board.new(value: board.value + move, spaces: @board_length)
    end
    available_indications = boards_with_moves.map do |board_with_move|
      solution.call(board_with_move)
    end
    required_indications = (0..(@board_length - 1)).to_a
    impossible_indications = (required_indications - available_indications)
    unless impossible_indications.empty?
      puts "no move available to indicate #{impossible_indications} for #{board}"
      puts "boards_with_moves #{boards_with_moves}"
      puts "available #{available_indications}"
    end
    impossible_indications.empty?
  end
end
