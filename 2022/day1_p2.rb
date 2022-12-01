i = 1
kcal = 0
elf_hash = Hash.new
File.foreach("day1_input.txt") do |line|
  if line.chomp.empty?
    elf_hash[i] = kcal
    kcal = 0
    i+=1
  else
    kcal+=line.to_i
  end
end

elf_sorted_array = elf_hash.sort_by{|k,v| v}.reverse
puts elf_sorted_array.slice(0, 3).to_h.values.sum
