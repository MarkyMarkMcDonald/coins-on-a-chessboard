require_relative './graph_vertex'

class Graph
  def initialize
    @vertexes = []
  end

  def find_or_add_vertex(vertex_value)
    vertex = find_vertex(vertex_value)
    if vertex.nil?
      vertex =  GraphVertex.new(vertex_value)
      @vertexes.push(vertex)
    end
    vertex
  end

  def find_vertex(vertex_value)
    index = @vertexes.find_index do |vertex|
      vertex.value == vertex_value
    end
    index.nil? ? @vertexes[index] : nil
  end

  def add_edge(first_vertex, second_vertex)
    unless first_vertex.edges.include? second_vertex
      first_vertex.edges.push(second_vertex)
      second_vertex.edges.push(first_vertex)
    end
  end
end