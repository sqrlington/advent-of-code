input = File.read("puzzle_input.txt").split("\n").map(&:split)

left = input.map {|element| element.first.to_i }
right = input.map {|element| element.last.to_i }

if left.size != right.size
  puts "list sizes do not match, returning"
  return
end

values = left.map do |value|
  right.count(value) * value
end

puts values.sum
