require 'pry'

class Consortium
  attr_reader :positions
  
  def initialize(positions)
    @positions = positions
  end

  def min_pos
    positions.min
  end

  def max_pos
    positions.max
  end

  def fuel(n)
    # calculate the fuel that each position
    # need to move and return the sum all they

    positions.inject(0) do |memo, pos_value|
      memo + (pos_value - n).abs
    end
  end
  
  def min_fuel
    min_fuel = Float::INFINITY
    min_pos.upto(max_pos).each do |n|
      f = fuel(n)
      if f < min_fuel
        min_fuel = f
      end
    end
    min_fuel
  end
end

if __FILE__ == $0
  positions = File.read(ARGV.first).chomp.split(',').map(&:to_i)
  c = Consortium.new(positions)
  puts "Result Part I #{c.min_fuel}"
end