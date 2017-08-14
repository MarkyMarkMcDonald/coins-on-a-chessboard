require_relative './solver.rb'
board = 0b1010
puts "possible moves for #{board.to_s(2)} are #{possible_moves(board)}"
raise "possible moves incorrect" unless possible_moves(board) == [1, -2, 4, -8, 0]
