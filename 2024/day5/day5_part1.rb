rules, updates = File.read("puzzle_input.txt").split("\n\n")

rules = rules.split("\n").map{|rule| rule.split("|").map(&:to_i)}.each_with_object({}) do |(key, value), hash|
  (hash[key] ||= []) << value
end
rules.default = []

updates = updates.split("\n").map{|update| update.split(",").map(&:to_i)}

output = []
updates.each_with_index do |row, idx|
  order = []
  (1..(row.size-1)).reverse_each do |column|
    rule = rules[row[column]]
    next if rule.empty?
    order << (rules[row[column]] & row.slice(0..column-1)).empty?
  end
  output << order
end

output.map!(&:all?)
middle_pages = 0
output.each_with_index do |in_order, idx|
  if in_order
    middle_pages+=(updates[idx])[updates[idx].size/2]
  end
end

puts "sum of middle pages: #{middle_pages}"
