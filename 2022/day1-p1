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

puts elf_hash.max_by{|k,v| v}
