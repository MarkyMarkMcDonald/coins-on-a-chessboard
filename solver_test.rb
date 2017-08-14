require_relative './solution_validator.rb'
board = Board.new(value: 0b0010, spaces: 4)
puts "possible moves for #{board} are #{board.possible_moves}"
raise "possible moves incorrect" unless board.possible_moves == [1, -2, 4, 8]
