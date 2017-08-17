require_relative './board'
require_relative './graph_vertex'
require_relative './graph'

class SolutionGenerator
  def initialize
    @board_length = 4
    @graph = Graph.new
  end

  def build_solution_graph
    build_graph(@graph)
    color_graph(@graph)
    @graph.print
  end

  private

  def build_graph(graph)
    possible_boards.each do |board|
      index = 0
      board.next_boards.each do |flipped_board|
        board_state = flipped_board.value

        graph_vertex = graph.find_or_add_vertex(board_state)

        board.next_boards[0...index].each do |previous_flipped_board|
          graph.add_edge(graph_vertex, graph.find_vertex(previous_flipped_board.value))
        end

        index += 1
      end
    end
  end

  def possible_boards
    (0...(2**@board_length)).map do |board_values|
      Board.new(value: board_values, size: @board_length)
    end
  end


  def color_graph(graph)
    color = 0
    vertex = graph.first_vertex
    vertex.color = color
    recursively_color_edges(vertex)
  end

  def recursively_color_edges(vertex)
    colored_count = vertex.edges.map do |adjacent_vertex|
      adjacent_vertex.color
    end.compact.length

    if colored_count < vertex.edges.length
      vertex.edges.each do |adjacent_vertex|
        color_edges(adjacent_vertex)
      end

      vertex.edges.each do |adjacent_vertex|
        recursively_color_edges(adjacent_vertex)
      end
    end
  end

  def color_edges(vertex)
    vertex.edges.each do |adjacent_vertex|
      if adjacent_vertex.color.nil?
        adjacent_vertex.color = first_available_color(adjacent_vertex)
      end
    end
  end

  def first_available_color(vertex)
    used_colors = vertex.edges.map do |adjacent_vertex|
      adjacent_vertex.color
    end.compact.sort
    all_colors = (0...@board_length).to_a
    # puts "all colors #{all_colors} useD_colors #{used_colors} available_colors #{all_colors - used_colors}"
    (all_colors - used_colors)[0]
  end

end
