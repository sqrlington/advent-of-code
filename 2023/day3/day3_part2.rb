schematic_grid = File.open("day3_sample_input.txt").readlines.map(&:chomp).map(&:chars)

# grab the indices of all the symbol locations and the number locations
symbol_locations, number_locations = [/\*/, /\d/].map do |regex|
  schematic_grid.each_with_object([]) do |row, arr|
    arr << row.each_index.select{|i| row[i].match?(regex)}
  end
end

# helper method to determine if a subarray is all continuous digits
def check_sum_match?(arr)
  m = arr.min - 1
  n = arr.max
  sum1 = arr.inject{|sum, x| sum = sum + x}
  sum2 = (n*(n+1) - m*(m+1))/2
  sum1 == sum2
end




# split the number locations up into units so we can treat the array of digits as whole number
number_locations.map! do |row|
  if row.empty?
    []
  elsif check_sum_match?(row)
    [row]
  else
    row.unshift(0).each_cons(2).slice_before{|m, n| m + 1 < n}.map{|a| a.map(&:last)}
  end
end

puts "#{symbol_locations.to_s}"
puts "#{number_locations.to_s}"
exit

MAX_ROW_SIZE = number_locations.size - 1

# find all of the locations to check around a digit
def locations_to_check(number)
  above_below_locations_to_check = []
  same_row_checks = []
  # step 1, use all the indices associated with the number
  above_below_locations_to_check << number
  # step 2, check to see if we can look ahead
  if number.last < MAX_ROW_SIZE
    above_below_locations_to_check.push(number.last + 1)
    same_row_checks.push(number.last + 1)
  end
  # step 3, check to see if we can look behind
  if number.first > 0
    above_below_locations_to_check.push(number.first - 1)
    same_row_checks.push(number.first - 1)
  end
  above_below_locations_to_check.flatten!
  same_row_checks.flatten!
  return above_below_locations_to_check, same_row_checks
end

sum = 0

for i in 0..MAX_ROW_SIZE do
  # if we have no symbol location in this row, move on
  next if symbol_locations[i].empty?

  # row 0 is a special case because we can't look look above it
  if 0 == i
    # if we find a gear symbol in the 0th row, we can only look left, right and down?
  # then we're on the last row and we can only look up
  elsif MAX_ROW_SIZE == i
  # otherwise we're just a middle row and can look up and down
  else

  end
end

puts "#{sum}"
