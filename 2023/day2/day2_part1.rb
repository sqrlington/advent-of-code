games = File.open("day2_sample_input.txt").readlines.map(&:chomp).map do |line|
 line.split(/(:|;)/).grep_v(/(:|;)/)
end.compact

def get_rgb_values(set)
  ["red", "green", "blue"].map do |color|
    match = set.match(/(\d+)\s#{color}/)
    match.nil? ? 0 : match[0].to_i
  end
end


def possible?(sets)
  result = sets.map do |set|
    red, green, blue = get_rgb_values(set)
    # magic numbers! :shrug:
    green <= 13 && red <= 12 && blue <= 14
  end.all?
end


sum = games.map do |game|
  game_number = game.shift.match(/(\d+)/)[1].to_i
  possible?(game) ? game_number : 0
end.sum

puts sum
