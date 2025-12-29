def split(n)

  digits = Math.log10(n).to_i + 1

  return if digits.odd?

  divisor = 10**(digits / 2)

  first_half = n / divisor
  second_half = n % divisor

  [first_half, second_half]
end

input = File.read("./day2/day2_input.txt")

result = []


input.split(",") do |range|
  start, finish = range.split("-")
  start = start.to_i
  finish = finish.to_i
  range = Range.new(start, finish)
  range.each { |num|
    first, rest = split(num)
    next unless first
    result << num if first == rest
  }
end



puts result.flatten.sum(&:to_i)



