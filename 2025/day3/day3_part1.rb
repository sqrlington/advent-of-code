input = File.readlines("puzzle_input.txt", chomp: true).map(&:chars)

total_joltage = input.sum do |bank|
  max_after = Array.new(bank.length)
  max_so_far = nil

  (bank.length - 1).downto(0) do |index|
    max_after[index] = max_so_far
    max_so_far = [max_so_far, bank[index].to_i].compact.max
  end

  (0...bank.length - 1).map do |index|
    "#{bank[index]}#{max_after[index]}".to_i if max_after[index]
  end.compact.max || 0
end

puts total_joltage
