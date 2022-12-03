scores = {
  "A X" => 4,
  "A Y" => 8,
  "A Z" => 3,
  "B X" => 1,
  "B Y" => 5,
  "B Z" => 9,
  "C X" => 7,
  "C Y" => 2,
  "C Z" => 6
}
input = File.read("day2.txt").split("\n").map {|round| scores[round]}
puts input.sum
