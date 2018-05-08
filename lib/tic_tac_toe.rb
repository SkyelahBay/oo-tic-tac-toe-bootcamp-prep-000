class TicTacToe
def initialize(board=nil) 
  @board = board || Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],  #horizontal
  [0,3,6],[1,4,7],[2,5,8],  #vertical
  [0,4,8],[2,4,6]           #diagonal
]


def input_to_index(input)
  @index = input.to_i - 1
  return @index
end

def position_taken?(index) #if pos is not nil or empty, it IS taken.
  !(@board[index] == nil || @board[index] == " ") ? true : false
end
def valid_move?(index)
  !index.between?(0,8) || position_taken?(index) ? false : true
end


def turn_count
  @board.count{|space| space == "X" || space == "O"}
end
def current_player
  turn_count.even? ? @player = "X" : @player = "O"
end


def move(index, player="X")
  @board[index] = player
  display_board
end

def won?
  WIN_COMBINATIONS.each do |combination| #for each combination
    holder = [] #nil, then 0,4,8
    @combination = combination #set the current array to the instance_var
    holder.push(@board[@combination[0]]) #0
    holder.push(@board[@combination[1]]) #4
    holder.push(@board[@combination[2]]) #8
    if holder.all?{|index| index =="X" || index == "O"} #if All contain X/O
      return @combination #this ends won? entirely.
    end
    holder.length = 0 #reset our holder.
  end #end iteration of WIN_COMBINATIONS

  @combination = false
  return @combination 
  #if no combination was returned that means no winner so return false.
end #end won?

def winner
  if !over? #if there is no draw or no winner the game is not over yet
    @winner = nil
  elsif @board[@combination[0]] == "X" 
    @winner = "X"
  elsif @board[@combination[0]] == "O" 
    @winner = "O"
  end
  return @winner
end

def full?
  @board.any?{|space| space == " " || space == nil} ? false : true 
end

def draw?
  if won? #if there's a winner, no draw.
    return false
  elsif full? #else if there's no winner, but the board is full
    return true
  end
end

def over?
  if draw? || won? || full? #if there is a draw, win, or full board
    return true
  else
    return false
  end
end

def turn
  phrase = "Please enter 1-9:"
  puts phrase
  @index = input_to_index(gets.strip)
  if valid_move?(@index)
    move(@index, current_player)
  else
    turn
  end
end

def play
  until over?
    turn
  end
  
  if won? #if over, check for a winner
    return "Congratulations #{@winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
  
  
  
  
  
  
  
  
end