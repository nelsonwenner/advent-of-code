class CaloriesCounter
  private attr_reader :foods, :calories

  def initialize(foods)
    @foods = foods.map(&:to_i)
    @calories = []
  end

  def sum_calories
    sum = 0

    @foods.each do |calorie|
      sum += calorie

      if calorie.zero? || calorie == @foods.last
        @calories << sum
        sum = 0
      end
    end
  end

  def get_maximum_calorie
    @calories.max
  end

  def get_sum_first_three_calories
    @calories.sort.reverse[0..2].sum
  end
end 

if __FILE__ == $0
  input = File.readlines(ARGV.first)

  calories_counter = CaloriesCounter.new(input)
  calories_counter.sum_calories

  puts "Maximum calorie: #{calories_counter.get_maximum_calorie}"
  puts "Sum first three calories: #{calories_counter.get_sum_first_three_calories}"
end
