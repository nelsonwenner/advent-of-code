require 'pry'

class School
  attr_reader :ages

  def initialize(ages)
    @ages = {}
    9.times do |i|
      @ages[i] = ages.count(i)
    end
  end

  def pass_days(n)
    n.times { |t| tick }
  end
  
  def num_fish
    @ages.values.inject(:+)
  end

  def tick
    births = @ages[0]
    8.times { |i| @ages[i] = @ages[i+1] }
    @ages[6] += births
    @ages[8] = births
  end
end

if __FILE__ == $0
  ages = File.read(ARGV.first).chomp.split(',').map(&:to_i)
  school = School.new(ages)
  school.pass_days(256)
  puts "Result: #{school.num_fish}"
end
