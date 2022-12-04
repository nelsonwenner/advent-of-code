require_relative '../../2022/day1/calories_counter.rb'

RSpec.describe 'Calories counter' do
  let(:foods) do
    [
      1000,
      2000,
      3000,
      '\n',
      4000,
      '\n',
      5000,
      6000,
      '\n',
      7000,
      8000,
      9000,
      '\n',
      10000
    ]
  end

  it 'returns the sum of foods of the `first elfo` with more calories' do
    calories_counter = CaloriesCounter.new(foods)
    
    calories_counter.sum_calories

    expect(calories_counter.get_maximum_calorie).to eq(24000)
  end

  it 'returns the sum of the food of the `first three elfos` with the most calories' do
    calories_counter = CaloriesCounter.new(foods)
    
    calories_counter.sum_calories

    expect(calories_counter.get_sum_first_three_calories).to eq(45000)
  end
end
