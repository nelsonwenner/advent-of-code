require_relative '../../2021/day4/bingo.rb'

RSpec.describe Bingo do
  it 'plays a number' do
    board = Board.new([
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25]
    ])
    bingo = described_class.new([board], [1, 2, 3, 4, 5])
    bingo.play
    expect(bingo.winning_board).to eq(board)
    expect(bingo.score).to eq(1550)
  end
  
end

RSpec.describe Board do
  describe '#mark' do
    it 'marks a number' do
      grid = Array.new(5) { Array.new(5, nil) }
      grid[0][0] = 5
      b = described_class.new(grid)
      b.mark(5)
      expect(b.rows[0][0]).to eq('x') 
    end
  end

  describe '#bingo?' do
    it 'is false for an empty board' do
      b = described_class.new(Array.new(5) { Array.new(5, nil) })
      expect(b).not_to be_bingo
    end
    
    it 'is true for a bingod board with a row' do
      grid = Array.new(5) { Array.new(5, nil) }
      5.times { |i| grid[0][i] = 'x' }
      b = described_class.new(grid)
      expect(b).to be_bingo
    end
    
    it 'is true for a bingod board with a column' do
      grid = Array.new(5) { Array.new(5, nil) }
      5.times { |i| grid[i][0] = 'x' }
      b = described_class.new(grid)
      expect(b).to be_bingo
    end
  end
end
