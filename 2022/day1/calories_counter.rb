class CaloriesCounter
  private attr_reader :calories, :sum_calories

  def initialize(calories)
    @calories = calories.map(&:chomp)
  end

  def sum_calories
    @sum_calories ||= @calories
                        .chunk_while { |a, b| b != '' }
                        .map { |group| group.map(&:to_i) }
                        .map(&:sum)
  end

  def get_maximum_calorie
    sum_calories.max
  end

  def get_sum_first_three_calories
    sum_calories.sort.reverse[0..2].sum
  end
end 

if __FILE__ == $0
  input = File.readlines(ARGV.first)

  calories_counter = CaloriesCounter.new(input)

  puts "Maximum calorie: #{calories_counter.get_maximum_calorie}"
  puts "Sum first three calories: #{calories_counter.get_sum_first_three_calories}"
end
