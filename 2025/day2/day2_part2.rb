input = File.read("puzzle_input.txt", chomp: true).split(",").map do |range|
  range.split("-").map(&:to_i)
end

invalid = input.sum do |start, finish|
  (start..finish).select { |num| num.to_s.match?(/^(\d+)\1+$/) }.sum
end

puts invalid