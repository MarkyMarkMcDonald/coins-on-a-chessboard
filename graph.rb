require_relative './graph_vertex'

class Graph
  def initialize
    @vertexes = []
  end

  def first_vertex
    @vertexes.first
  end

  def find_or_add_vertex(vertex_value)
    vertex = find_vertex(vertex_value)
    if vertex.nil?
      vertex =  GraphVertex.new(value: vertex_value)
      @vertexes.push(vertex)
    end
    vertex
  end

  def find_vertex(vertex_value)
    index = @vertexes.find_index do |vertex|
      vertex.value == vertex_value
    end
    index.nil? ? nil : @vertexes[index]
  end

  def add_edge(first_vertex, second_vertex)
    unless first_vertex.edges.include? second_vertex
      first_vertex.edges.push(second_vertex)
      second_vertex.edges.push(first_vertex)
    end
  end

  def print
    values_by_color = {}
    @vertexes.each do |vertex|
      values_by_color[vertex.color] ||= []
      values_by_color[vertex.color].push(vertex.value)
    end

    values_by_color.each_pair do |color, colored_values|
      puts "color: #{color}"
      colored_values.each do | value |
        puts value.to_s(2).rjust(4, '0')

      end
    end
  end
end