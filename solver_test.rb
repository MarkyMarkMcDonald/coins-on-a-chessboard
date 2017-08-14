require_relative './solution_validator.rb'
board = Board.new(value: 0b0010, spaces: 4)
puts "possible new boards from #{board} are #{board.next_boards.map(&:to_s)}"
raise "possible moves incorrect" if (board.next_boards.map(&:value) & [0, 3, 6, 10]).length != 4
