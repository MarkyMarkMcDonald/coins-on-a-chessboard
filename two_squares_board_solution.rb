require_relative './solution_validator.rb'

some_solution = ->(board) do
  (board.to_s.start_with?("1") ? 0 : 1) % 2
end

puts 'Congratulations!' if SolutionValidator.new(board_length: 2).valid?(some_solution)

