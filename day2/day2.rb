input = File.read("./day2/day2_test.txt")

result = []
input.split(",") do |range|
  start, finish = range.split("-")
  range = Range.new(start, finish)
  range.each { |num|
    length = num.length
    next if length.odd?
    first = num[0..length/2 - 1]
    rest = num[length/2..]
    result << num if first == rest
  }
end

puts result.flatten.sum(&:to_i)



