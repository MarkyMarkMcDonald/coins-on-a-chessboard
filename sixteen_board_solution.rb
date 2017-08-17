require_relative './solution_validator'
require_relative './solution_generator'


SolutionGenerator.new.build_solution_graph

# some_solution = ->(board) do
#
# end
#
#
# unless SolutionValidator.new(board_length: 4).valid?(some_solution)
#   raise 'Not a valid solution'
# end
# puts 'Congratulations!'
#
