
def all_elements_increasing?(array)
  array.each_cons(2).all? {|x, y| x < y}
end

def all_elements_decreasing?(array)
  array.each_cons(2).all?{|x, y| x > y }
end

def all_values_within_parameters?(array)
  array.each_cons(2).all? do |x,y|
    diff = (x - y).abs
    diff <= 3 && diff > 0
  end
end

def safe?(array)
  if (all_elements_decreasing?(array) || all_elements_increasing?(array))
    all_values_within_parameters?(array)
  else
    false
  end
end

def problem_dampener(array)
  array.map.with_index do |_obj, x|
      temp_array = array.dup
      temp_array.delete_at(x)
    safe?(temp_array)
  end.any?
end

input = File.read("puzzle_input.txt").split("\n").map(&:split).map{|arr| arr.map(&:to_i)}

safe_reports = input.map do |report|
    if safe?(report)
      "safe"
    elsif problem_dampener(report)
      "safe"
    end
end.compact

puts "safe reports: #{safe_reports.size}"

# sample inputs
# report 0: safe always
# report 1: unsafe always
# report 2: unsafe always
# report 3: unsafe safe only by removing the 2nd OR 3rd element
# report 4: unsafe safe only by removing the 3rd or 4th element
# report 5: safe always
