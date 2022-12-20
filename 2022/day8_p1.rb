GRID = File.read("day8.txt").split("\n").map{|line| line.chars.map(&:to_i)}
GRID_COLUMN_SIZE = GRID.first.size
GRID_ROW_SIZE = GRID.size

# first find the edge nodes
perimeter_visibility = 2*(GRID_COLUMN_SIZE - 1) + 2*(GRID_ROW_SIZE - 1)

def check_tree(row, column)
  ranges = {
    #when you are going up or down, the column remains fixed and the row changes
    :up => Range.new(0, row-1).to_a.reverse,
    :down => Range.new(row+1, GRID_ROW_SIZE-1).to_a,
    #when you are going left or right, the row remains fixed but the column changes
    :left => Range.new(0, column-1).to_a.reverse,
    :right => Range.new(column+1,GRID_COLUMN_SIZE-1).to_a
  }.sort_by {|k,v| v.size}.to_h

  tree_height = GRID[row][column]

  ranges.each do |direction, range|
    case direction
    when :up, :down
      return 1 if range.map{|index| tree_height > GRID[index][column]}.all?
    when :left, :right
      return 1 if range.map{|index| tree_height > GRID[row][index]}.all?
    end
  end
  0
end

interior_visibility = 0
(1..GRID_ROW_SIZE-2).each do |row|
  (1..GRID_COLUMN_SIZE-2).each do |column|
    interior_visibility += check_tree(row, column)
  end
end

puts interior_visibility+perimeter_visibility
