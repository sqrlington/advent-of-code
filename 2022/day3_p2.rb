PRIORITIES_HASH = Hash[("a".."z").to_a.zip(1..26).to_a+("A".."Z").to_a.zip(27..52).to_a]

priority_list = []
File.foreach("day3.txt").each_slice(3) do |lines|
  priority_list.push(PRIORITIES_HASH[lines.map{|line| line.chars}.inject(:&).first])
end

puts priority_list.sum








