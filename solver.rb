class Solver
  BOARD_LENGTH = 2
  STARTING_BOARD = 0
  ENDING_BOARD = (2**BOARD_LENGTH) - 1
  POSSIBLE_BOARDS = (STARTING_BOARD..ENDING_BOARD)

  def solve(solution)
    solution_is_correct = POSSIBLE_BOARDS.all? do |board|
      check(board, solution)
    end
    puts solution_is_correct
    solution_is_correct
  end

  private

  def check(board, solution)
    puts "called check with board: #{board.to_s(2)}"
    boards_with_moves = possible_moves(board).map do |move|
      board += move
    end
    puts "boards with moves"
    boards_with_moves.map do |board|
      # puts board.to_s(2)
    end
    available_indications = boards_with_moves.map do |board|
      solution.call(board)
    end
    required_indications = (0..(BOARD_LENGTH - 1)).to_a
    impossible_indications = (required_indications - available_indications)
    unless impossible_indications.empty?
      puts "no move would indicate these indices: #{impossible_indications} for this board: #{board.to_s(2)}"
    end
    impossible_indications.empty?
  end

  def possible_moves(board)
    board_with_padding = board.to_s(2).rjust(BOARD_LENGTH, '0')
    moves = board_with_padding.chars.reverse.map.with_index do |coin, index|
      direction = coin === '1' ? -1 : 1
      (2 ** index) * direction
    end
    empty_move = 0
    moves + [empty_move]
  end
end

some_solution = ->(board) do
  board_with_padding = board.to_s(2).rjust(Solver::BOARD_LENGTH, '0')
  puts "solution was called with board:"
  puts board_with_padding
  board_with_padding.start_with?("1") ? 0 : 1
end

Solver.new.solve(some_solution)
