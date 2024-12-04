input = File.read("puzzle_input.txt").split("\n").map(&:split)


left = input.map {|element| element.first.to_i }.sort
right = input.map {|element| element.last.to_i }.sort

if left.size != right.size
  puts "list sizes do not match, returning"
  return
end

values = left.zip(right).map { |a,b| (a - b).abs }

puts values.sum


# sample input sum is 11
# puzzle input is 1666427
