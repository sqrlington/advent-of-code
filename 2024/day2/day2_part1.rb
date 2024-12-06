
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

input = File.read("puzzle_input.txt").split("\n").map(&:split).map{|arr| arr.map(&:to_i)}

safe_reports = input.map do |report|
    if all_elements_decreasing?(report) || all_elements_increasing?(report)
      if all_values_within_parameters?(report)
         "safe"
      end
    end
end.compact

puts "safe reports: #{safe_reports.size}"




# sample inputs
# report 0: safe
# report 1: unsafe
# report 2: unsafe
# report 3: unsafe
# report 4: unsafe
# report 5: safe
