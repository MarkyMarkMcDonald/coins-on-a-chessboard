require_relative './solution_validator.rb'

some_solution = ->(board) do
  (board.to_s.start_with?("1") ? 0 : 1) % 2
end

unless SolutionValidator.new(board_length: 64).valid?(some_solution)
  raise 'Not a valid solution'
end
puts 'Congratulations!'

