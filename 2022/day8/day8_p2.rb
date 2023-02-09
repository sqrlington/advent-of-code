GRID = File.read("day8.txt").split("\n").map{|line| line.chars.map(&:to_i)}
GRID_COLUMN_SIZE = GRID.first.size
GRID_ROW_SIZE = GRID.size

def tree_scenic_score(row, column)
  #when you are going up or down, the column remains fixed and the row changes
  #when you are going left or right, the row remains fixed but the column changes
  ranges = {
    :up => Range.new(0, row-1).to_a.reverse,
    :down => Range.new(row+1, GRID_ROW_SIZE-1).to_a,
    :left => Range.new(0, column-1).to_a.reverse,
    :right => Range.new(column+1,GRID_COLUMN_SIZE-1).to_a
  }.sort_by {|k,v| v.size}.to_h

  tree_height = GRID[row][column]
  tree_scores = []

  ranges.each do |direction, range|
    case direction
    when :up, :down
      i = 0
      range.each do |index|
        i+=1
        if tree_height <= GRID[index][column]
          break;
        end
      end
      tree_scores.push(i)
    when :left, :right
      i=0
      range.each do |index|
        i+=1
       if tree_height <= GRID[row][index]
        break
       end
      end
      tree_scores.push(i)
    end
  end
  tree_scores.inject(:*)
end

best_tree_score = 0
(1..GRID_ROW_SIZE-2).each do |row|
  (1..GRID_COLUMN_SIZE-2).each do |column|
    current_tree_score = tree_scenic_score(row, column)
    best_tree_score = current_tree_score if current_tree_score > best_tree_score
  end
end

puts best_tree_score
