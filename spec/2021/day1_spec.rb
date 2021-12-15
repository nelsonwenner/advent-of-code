require_relative '../../2021/day1/number_increases.rb'

RSpec.describe 'number_of_increases' do
  it 'counts one increase' do
    num = number_of_increases([1, 2])
    expect(num).to eq(1)
  end

  it 'counts two increase' do
    num = number_of_increases([1, 2, 3])
    expect(num).to eq(2)
  end

  it 'counts two increase with a decrease' do
    num = number_of_increases([4, 1, 2, 3, 1])
    expect(num).to eq(2)
  end

  it 'works for example input' do
    num = number_of_increases([
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ])
    expect(num).to eq(7)
  end
end
