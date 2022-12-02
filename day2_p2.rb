scores = {
  "A X" => 3,
  "A Y" => 4,
  "A Z" => 8,
  "B X" => 1,
  "B Y" => 5,
  "B Z" => 9,
  "C X" => 2,
  "C Y" => 6,
  "C Z" => 7
}
input = File.read("day2.txt").split("\n").map {|round| scores[round]}
puts input.sum
