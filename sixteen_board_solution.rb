require_relative './solution_validator'
require_relative './board'
require_relative './graph_vertex'

class SolutionGenerator
  def initialize
    @board_length = 4
    @vertexes = []
    @graph = Graph.new
  end

  def build_graph
    possible_boards.each do |board|
      board.next_boards.each do |flipped_board, index|
        board_state = flipped_board.value

        graph_vertex = @graph.find_or_add_vertex(board_state)

        board.next_boards[0...index].each do |previous_flipped_board|
          @graph.add_edge(graph_vertex, @graph.find_vertex(previous_flipped_board.value))
        end
      end
    end
  end

  def possible_boards
    (0..(2**@board_length - 1)).map do |board_values|
      Board.new(value: board_values, size: @board_length)
    end
  end


end

some_solution = ->(board) do

end


unless SolutionValidator.new(board_length: board_length).valid?(some_solution)
  raise 'Not a valid solution'
end
puts 'Congratulations!'

