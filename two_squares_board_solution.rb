require_relative './solver.rb'

some_solution = ->(board) do
  (board.to_s.start_with?("1") ? 0 : 1) % 2
end

puts 'Congratulations!' if Solver.new(board_length: 2).solve(some_solution)

