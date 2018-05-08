class TicTacToe
def initialize(board=nil) 
  @board = board || Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[9]} "
end

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],  #horizontal
  [0,3,6],[1,4,7],[2,5,8],  #vertical
  [0,4,8],[2,4,6]           #diagonal
]


def input_to_index(input)
  return input.to_i - 1
end

def position_taken?(index) #if pos is not nil or empty, it IS taken.
  !(@board[index] == nil || @board[index] == " ") ? true : false
end
def valid_move?(index)
  !index.between?(0..8) || position_taken?(index) ? false : true
end

def turn_count
  @board.count{|space| space == "X" || space == "O"}
end
def current_player
  turn_count.even? ? @player = "X" : @player = "O"
end

def move(index, player)
  @board[@index] = @player
  display_board
end

def play
  
end
  
  
  
  
  
  
  
  
end