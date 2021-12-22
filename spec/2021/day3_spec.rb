require_relative '../../2021/day3/diagnostic.rb'

RSpec.describe Diagnostic do
  it 'calculates gamma_rate for a simple case' do
    diagnostic = Diagnostic.new([
      0b00100,
      0b11110,
      0b10110
    ])
    expect(diagnostic.gamma_rate).to eq(0b10110)
  end

  it 'calculates epsilon for a simple case' do
    diagnostic = Diagnostic.new([
      0b00100,
      0b11110,
      0b10110
    ])
    expect(diagnostic.epsilon_rate).to eq(0b01001)
  end
end
