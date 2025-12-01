input = File.readlines("puzzle_input.txt", chomp: true).map do |line|
  line.sub("L", "-").sub("R", "").to_i
end

position = 50
password = input.map {|item| position = (position + item) % 100 }.count(0)
puts "#{password}"