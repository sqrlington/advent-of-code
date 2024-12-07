# Regex pattern with capture groups
pattern = /^(.*?)don't|(do\b(.*?)don't)|do\b(.*)$/
capture_multiples = /mul\((\d+),(\d+)\)/
yeet = /don't.*?do\b|don't.*?$/

result = File.read("puzzle_input.txt")
  .split("\n")
  .map {|garbage| garbage.gsub(yeet, "")}
  .map {|tuples| tuples.scan(capture_multiples)}
  .flatten(1)
  .map {|strings| strings.map(&:to_i)}
  .map {|x, y| x*y}
  .sum

puts "#{result.size}"
