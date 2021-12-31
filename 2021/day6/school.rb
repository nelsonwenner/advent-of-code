require 'pry'

class School
  attr_reader :ages

  def initialize(ages)
    @ages = ages
  end

  def pass_days(n)
    n.times { |t| tick }
  end
  
  def num_fish
    @ages.count
  end

  def tick
    births = @ages.count(0)
    @ages.map! do |a| 
      if a == 0
        6
      else
        a - 1
      end
    end
    @ages += [8] * births
  end
end

if __FILE__ == $0
  ages = File.read(ARGV.first).chomp.split(',').map(&:to_i)
  school = School.new(ages)
  school.pass_days(80)
  puts "Result Part I: #{school.num_fish}"
end
