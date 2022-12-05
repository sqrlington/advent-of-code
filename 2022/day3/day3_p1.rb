PRIORITIES_HASH = Hash[("a".."z").to_a.zip(1..26).to_a+("A".."Z").to_a.zip(27..52).to_a]

input = File.read("day3.txt").split("\n").map do |line|
   first_half = line.slice(0..(line.length/2)-1).chars
   second_half = line.slice(line.length/2..line.length-1).chars
   PRIORITIES_HASH[(first_half & second_half).first]
end

puts input.sum



