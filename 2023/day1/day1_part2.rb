# Your calculation isn"t quite right. It looks like some of the digits are actually spelled
# out with letters: one, two, three, four, five, six, seven, eight, and nine also count as
# valid "digits".
DIGITS = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" =>  "6",
  "seven" => "7",
  "eight" => "8",
  "nine"  => "9"
}

# https://www.rexegg.com/regex-lookarounds.html
# Positive lookahead (new to me concept) will pick up the messy values of eightwo as 82
LOOKAHEAD_MATCH_REGEX = /(?=(#{DIGITS.values.join("|")}|#{DIGITS.keys.join("|")}))/

def translate_digit(digit)
  DIGITS[digit] || digit
end

elf_doodle_mess = File.open("input.txt").readlines.map(&:chomp)

values = elf_doodle_mess.map do |line|
  all_the_matches = line.scan(LOOKAHEAD_MATCH_REGEX).flatten
  first_digit = translate_digit(all_the_matches.first)
  last_digit = translate_digit(all_the_matches.last)
  (first_digit + last_digit).to_i
end

puts "sum: #{values.sum}"
