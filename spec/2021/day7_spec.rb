require_relative '../../2021/day7/crabs.rb'

RSpec.describe Consortium do
  let(:positions) { [16,1,2,0,4,2,7,1,2,14] }

  describe '.min_fuel' do
    it 'calculate the fuel to move to a new position' do
      c = described_class.new(positions)
      expect(c.min_fuel).to eq(37)
    end
  end

  describe '.max_pos' do
    it 'calculate the range correctly' do
      c = described_class.new(positions)
      expect(c.max_pos).to eq(16)
    end
  end

  describe '.min_pos' do
    it 'calculate the range correctly' do
      c = described_class.new(positions)
      expect(c.min_pos).to eq(0)
    end
  end

  describe '.fuel' do
    let(:positions) { [1,5,9] } # 1->2, 5->2, 9->6

    it 'calcule fuel for a specific positions' do
      c = described_class.new(positions)
      expect(c.fuel(3)).to eq(10)
    end
  end
end
