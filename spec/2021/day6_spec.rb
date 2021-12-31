require_relative '../../2021/day6/school.rb'

RSpec.describe School do
  it 'works for the example case' do
    school = described_class.new([3, 4, 3, 1, 2])
    school.pass_days(80)
    expect(school.num_fish).to eq(5934)
  end

  it 'decrements ages by 1 when it tick' do
    school = described_class.new([4])
    school.tick
    expect(school.ages).to eq({
      0 => 0,
      1 => 0,
      2 => 0,
      3 => 1,
      4 => 0,
      5 => 0,
      6 => 0,
      7 => 0,
      8 => 0
    })
  end

  it 'births a new fish after 0' do
    school = described_class.new([0])
    school.tick
    expect(school.ages).to eq({
      0 => 0,
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0,
      6 => 1,
      7 => 0,
      8 => 1
    })
  end
end
