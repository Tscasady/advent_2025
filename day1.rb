class Dial
  attr_reader :result

  def initialize()
    @pointer = 50
    @dial = [*0..99]
    @result = 0
  end

  def spin(command)
    @pointer = (@pointer + command) % @dial.size
    puts @pointer
    @result += 1 if @dial[@pointer] == 0
  end
end

def parse(line)
  rest = line[1..-1]
  line.chr == 'R' ? rest.to_i : -rest.to_i
end

dial = Dial.new()

File.foreach("./day1_input.txt").map do |line|
  line.chomp!
  dial.spin(parse(line))
end

puts dial.result



