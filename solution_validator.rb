require_relative './board'

class SolutionValidator
  def initialize(board_length:)
    @board_length = board_length
  end

  def valid?(solution)
    possible_boards.all? do |board|
      check(board, solution)
    end
  end

  private

  def possible_boards
    (0..(2**@board_length - 1)).map do |board_values|
      Board.new(value: board_values, size: @board_length)
    end
  end

  # The solution indicates an index on the board given the board's value.
  # returns true if every index on the board can be indicated by the solution
  # for at least one of the possible next boards
  def check(board, solution)
    available_indications = board.next_boards.map do |board_with_move|
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
