input = File.readlines("puzzle_input.txt", chomp: true).map(&:chars)

total_joltage = input.sum do |bank|
  k = bank.length - 12  # number of digits to remove
  stack = []
  removals_left = k

  bank.each do |digit|
    # Remove smaller digits before this one
    while !stack.empty? && removals_left > 0 && stack.last.to_i < digit.to_i
      stack.pop
      removals_left -= 1
    end

    stack.push(digit)
  end

  # If we still have removals left, remove from the end
  while removals_left > 0
    stack.pop
    removals_left -= 1
  end

  # Convert stack to number
  stack.join.to_i
end

puts total_joltage

