require_relative '../../2022/day1/calories_counter.rb'

RSpec.describe CaloriesCounter do
  subject(:calories_counter) { described_class.new(calories) }

  let(:calories) { filepath(year: '2022', day: 'day1', filename: 'input1.txt') }

  it 'returns the sum of foods of the `first elfo` with more calories' do
    expect(calories_counter.get_maximum_calorie).to eq(24000)
  end

  it 'returns the sum of the food of the `first three elfos` with the most calories' do
    expect(calories_counter.get_sum_first_three_calories).to eq(45000)
  end
end
