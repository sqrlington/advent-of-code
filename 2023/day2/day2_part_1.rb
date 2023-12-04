games = File.open("input.txt").readlines.map(&:chomp).map do |line|
 line.split(/(:|;)/).grep_v(/(:|;)/)
end.compact

def get_color_value(set, color)
  match = set.match(/(\d+)\s#{color}/)
  if match.nil?
    0
  else
    match[0].to_i
  end
end


def is_possible?(sets)
  result = sets.map do |set|
    red = get_color_value(set, "red")
    green = get_color_value(set, "green")
    blue = get_color_value(set, "blue")

    # magic numbers! :shrug:
    green <= 13 && red <= 12 && blue <= 14
  end.all?
end

sum = 0

games.each do |game|
  game_number = game.shift.match(/(\d+)/)[1].to_i
  sum = sum + game_number if is_possible?(game)
end

puts sum
