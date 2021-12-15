require_relative '../../2021/day2/submarine.rb'

RSpec.describe Submarine do
  it 'works with dsl' do
    submarine = described_class.new do
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    end
    expect(submarine.location).to eq(150)
  end

  it 'works for the example use case' do
    submarine = described_class.new
    submarine.forward(5)
    submarine.down(5)
    submarine.forward(8)
    submarine.up(3)
    submarine.down(8)
    submarine.forward(2)
    expect(submarine.location).to eq(150)
  end

  describe 'forward' do
    it 'increases position' do
      submarine = described_class.new
      expect(submarine.position).to eq(0)
      submarine.forward(2)
      expect(submarine.position).to eq(2)
    end
  end

  describe 'up' do
    it 'decreases depth' do
      submarine = described_class.new
      expect(submarine.depth).to eq(0)
      submarine.up(2)
      expect(submarine.depth).to eq(-2)
    end
  end

  describe 'down' do
    it 'increases depth' do
      submarine = described_class.new
      expect(submarine.depth).to eq(0)
      submarine.down(2)
      expect(submarine.depth).to eq(2)
    end
  end
end

RSpec.describe AimingSubmarine do
  describe 'forward' do
    it 'increases position by aim * n' do
      aiming_submarine = described_class.new
      expect(aiming_submarine.position).to eq(0)
      aiming_submarine.down(2)
      aiming_submarine.forward(3)
      expect(aiming_submarine.position).to eq(3)
      expect(aiming_submarine.depth).to eq(2 * 3)
    end
  end

  describe 'up' do
    it 'decreases aim' do
      aiming_submarine = described_class.new
      expect(aiming_submarine.aim).to eq(0)
      aiming_submarine.up(2)
      expect(aiming_submarine.aim).to eq(-2)
    end
  end

  describe 'down' do
    it 'decreases aim' do
      aiming_submarine = described_class.new
      expect(aiming_submarine.aim).to eq(0)
      aiming_submarine.down(2)
      expect(aiming_submarine.aim).to eq(2)
    end
  end
end
