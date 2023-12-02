# Your calculation isn"t quite right. It looks like some of the digits are actually spelled
# out with letters: one, two, three, four, five, six, seven, eight, and nine also count as
# valid "digits".

STUPID_COMBO_NUMBERS = {
  "twone" => "21",
  "oneight" => "18",
  "eightwo" => "82",
  "eighthree" => "83",
  "threeight" => "38",
  "fiveight" => "58",
  "sevenine" => "79",
  "nineight" => "98"
}

STRING_TO_INT_HASH = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
}

sum = 0
File.foreach("day1_input.txt") do |line|
  # remove the first order of wacky matches because they screw with everything.
  STUPID_COMBO_NUMBERS.each do |key, value|
    line.sub!(/#{key}/, value)
  end

  # now that the wacky matches are out, just convert the regular numbers
  STRING_TO_INT_HASH.each do |key, value|
    line.sub!(/#{key}/, value)
  end

  digits = line.scan(/\d/)
  puts "digits: #{digits.to_s}"
  calibration_value = digits[0].to_s + digits[digits.size-1].to_s
  puts "calibration value: #{calibration_value}"
  sum = sum + calibration_value.to_i
end

puts "sum: #{sum}"

# current output is sum: 55189 and that's supposedly too low
# new output is 55227 but that doesn't seem all that much higher :| THIS IS TOO HIGH?! WHAT!
# so my range is now... 38 values
