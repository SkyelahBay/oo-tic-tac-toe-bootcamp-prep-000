class TicTacToe
def initialize(board=nil) 
  @board = board || Array.new(9, " ")
end

def display_board
  puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
  puts "-----------"
  puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
  puts "-----------"
  puts "#{@board[6]} | #{@board[7]} | #{@board[9]}"
end

def WIN_COMBINATIONS
  
end


def play
  
end
  
  
  
  
  
  
  
  
end