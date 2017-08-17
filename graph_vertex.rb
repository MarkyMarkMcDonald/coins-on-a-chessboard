class GraphVertex
  attr_reader :value
  attr_accessor :color
  attr_accessor :edges

  def initialize(value:)
    @value = value
    @edges = []
  end
end