class Dial
  attr_reader :result

  def initialize()
    @pointer = 50
    @dial = [*0..99]
    @result = 0
  end

  def spin(command)
    @pointer = (@pointer + command) % @dial.size
    @result += 1 if @dial[@pointer] == 0
  end


  def spin_part2(command)
    puts "Command #{command}"
    laps, new_pointer = (@pointer + command).divmod(@dial.size)
    if command.positive?
      @result += laps
    else
      #silly
      @result += laps.abs
      if new_pointer <= @pointer && laps.abs > 0
        @result -=1
      end
      #heinous
      @result -= 1 if @pointer == 0
      @result += 1 if new_pointer == 0
      #cases: start at 0 
    end
    @pointer = new_pointer
    puts @result
  end
end

def parse(line)
  rest = line[1..-1]
  line.chr == 'R' ? rest.to_i : -rest.to_i
end

dial = Dial.new()

File.open("./day1_input.txt").map do |line|
  line.chomp!
  dial.spin_part2(parse(line))
end

puts dial.result



