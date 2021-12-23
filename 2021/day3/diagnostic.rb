class Diagnostic
  attr_reader :measurements

  def initialize(measurements)
    @measurements = measurements
  end

  def gamma_rate
    half = measurements.size / 2
    freq.map { _1 <= half ? 0 : 1 }.join.to_i(2)
  end

  def epsilon_rate
    gamma_rate ^ (['1'] * width).join.to_i(2)
  end

  def freq
    counter = [0] * width
    measurements.each do |m|
      width.times do |i|
        counter[i] += m[i]
      end
    end
    counter.reverse
  end

  def width
    measurements.max.to_s(2).size
  end
end

if __FILE__ == $0
  measurements = File.readlines(ARGV.first).map { _1.to_i(2) }
  diagnostic = Diagnostic.new(measurements)
  puts diagnostic.gamma_rate * diagnostic.epsilon_rate
end
