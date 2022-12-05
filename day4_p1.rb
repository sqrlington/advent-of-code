input = File.read("day4.txt").split("\n").map {|pairing| pairing.split(",")}.map do |ranges|
   range1 = Range.new(ranges[0].split("-").map(&:to_i).first,ranges[0].split("-").map(&:to_i).last).to_a
   range2 = Range.new(ranges[1].split("-").map(&:to_i).first,ranges[1].split("-").map(&:to_i).last).to_a
   intersection = range1 & range2
   if intersection.empty?
      false
   else
      range1 == intersection || range2 == intersection
   end
end

puts input.count(true)

