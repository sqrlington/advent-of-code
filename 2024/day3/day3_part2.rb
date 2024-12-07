# Regex pattern with capture groups
capture_multiples = /mul\((\d+),(\d+)\)/
yeet = /don't\(\).*?do\(\)|don't\(\).*?$/

input = File.read("puzzle_input.txt").gsub("\n", "").gsub(yeet, "")

result = input.scan(capture_multiples)
  .map {|strings| strings.map(&:to_i)}
  .map {|x, y| x*y}
  .sum

puts "#{result}"
