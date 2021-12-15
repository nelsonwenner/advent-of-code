def number_of_increases(input)
  input.each_cons(2).reduce(0) do |acc, (x, y)|
    acc += 1 if x < y
    acc
  end
end

def windows(n, input)
  input.each_cons(n).map(&:sum)
end

if __FILE__ == $0
  input = File.readlines(ARGV.first).map(&:to_i)
  puts number_of_increases(windows(3, input))
end
