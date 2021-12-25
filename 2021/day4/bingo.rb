class Bingo
  attr_reader :boards, :numbers

  def initialize(boards, numbers)
    @boards = boards
    @numbers = numbers
  end

  def play
    numbers.each do |n|
      boards.each do |board|
        board.mark(n)
        
        if board.bingo?
          @winning_board = board
          @last_number = n
          return 
        end
      end
    end
  end

  def score
    winning_board.score * @last_number
  end

  def winning_board
    @winning_board
  end
end

class Board
  attr_reader :rows
  
  def initialize(rows)
    @rows = rows
  end

  def score
    @rows.flatten.reject { |i| i == 'x' }.inject(:+)
  end

  def columns
    @rows.transpose
  end

  def bingo?
    @rows.any? { |row| row.all? { |cell| cell == 'x' } } || 
      columns.any? { |row| row.all? { |cell| cell == 'x' } }
  end

  def mark(n)
    @rows.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        if cell == n
         @rows[x][y] = 'x'
        end
      end
    end
  end
end

if __FILE__ == $0
  numbers, *board_lines = File.readlines(ARGV.first)
  numbers = numbers.chomp.split(',').map(&:to_i)
  
  rows = []
  boards = []
  
  board_lines.each do |line|
    next if line.chomp == ''
    rows << line.split(' ').map(&:to_i)

    if rows.size == 5
      boards << Board.new(rows)
      rows = []
    end
  end

  bingo = Bingo.new(boards, numbers)
  bingo.play
  puts bingo.score
end