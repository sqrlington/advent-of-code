# The newly-improved calibration document consists of lines of text;
# each line originally contained a specific calibration value that the Elves
# now need to recover.
# On each line, the calibration value can be found by combining the first digit
# and the last digit (in that order) to form a single two-digit number.

sum = 0
File.foreach("day1_input.txt") do |line|
  digits = line.scan(/\d/)
  calibration_value = "#{digits[0]}" + "#{digits[digits.size-1]}"
  sum = sum + calibration_value.to_i
end

puts sum
