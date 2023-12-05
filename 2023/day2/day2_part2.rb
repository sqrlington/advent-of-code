games = File.open("input.txt").readlines.map(&:chomp).map do |line|
 line.split(/(:|;)/).grep_v(/(:|;)/)
end.compact

def get_color_value_max(sets, color)
  sets.scan(/(\d+)\s#{color}/).flatten.map(&:to_i).max
end


def power_level(sets)
  red_max = get_color_value_max(sets, "red")
  green_max = get_color_value_max(sets, "green")
  blue_max = get_color_value_max(sets, "blue")
  red_max * green_max * blue_max
end

sum = 0

games.each do |game|
  sum = sum + power_level(game.join)
end

puts sum
