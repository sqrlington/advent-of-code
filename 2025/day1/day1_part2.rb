input = File.readlines("puzzle_input.txt", chomp: true).map do |line|
  line.sub("L", "-").sub("R", "").to_i
end

position = 50
count = 0

input.each do |rotation|
  if rotation.negative? 
    if position == 0
      count += rotation.abs / 100
    elsif rotation.abs >= position
      count += 1 + (rotation.abs - position) / 100
    end
  else
    count += (position + rotation) / 100
  end

  position = (position + rotation) % 100
end

puts "#{count}"