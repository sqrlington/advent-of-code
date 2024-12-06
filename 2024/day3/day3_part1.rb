# Regex pattern with capture groups
pattern = /mul\((\d+),(\d+)\)/

result = File.read("puzzle_input.txt").scan(pattern).map {|match| match.map(&:to_i)}.map {|x, y| x*y}.sum

puts "#{result}"
