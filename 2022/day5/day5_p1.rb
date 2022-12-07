crate_layout, directions = File.read("day5.txt").split("\n\n").map {|input| input.split("\n")}
stacks = Array.new(crate_layout.pop.split.last.to_i) { Array.new }
crate_layout.reverse!
remove_chars = ["[", "]", " "]

crate_layout.each do |crate_row|
  row = crate_row.chars.each_slice(4).to_a.map do |slice|
    slice - remove_chars
  end

  row.each_with_index do |crate, index|
    stacks[index].push(crate.first) unless crate.empty?
  end
end

directions.each do |line|
  amount, source, destination = line.scan(/\d+/).to_a.map(&:to_i)
  amount.times {
    crate_to_move = stacks[source-1].pop
    stacks[destination-1].push(crate_to_move) unless crate_to_move.nil?
  }
end

puts stacks.map(&:last).join
