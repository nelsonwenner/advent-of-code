require_relative '../../2022/day1/calories_counter.rb'

RSpec.describe 'Calories counter' do
  it 'returns the sum foods of the elfos with more calories' do
    calories_counter = CaloriesCounter.new([
      1000,
      2000,
      3000,
      0,
      4000,
      0,
      5000,
      6000,
      0,
      7000,
      8000,
      9000,
      0,
      10000
    ])
    
    calories_counter.sum_calories

    expect(calories_counter.get_maximum_calorie).to eq(24000)
  end
end
