class GraphVertex
  attr_reader :value
  attr_accessor :color
  attr_accessor :edges

  initialize(value) do
    @value = value
    @edges = []
  end


end