schematic_grid = File.open("puzzle_input.txt").readlines.map(&:strip).map(&:chars)
DIRECTIONS = [
  [-1, -1],
  [-1, 0],
  [-1, 1],
  [0, -1],
  [0, 1],
  [1, -1],
  [1, 0],
  [1, 1]
].freeze


ROWS = schematic_grid.size - 1
COLS = schematic_grid[0].size - 1
PAPER_ROLL = '@'

accessible_rolls = (0..ROWS).sum do |row|
  (0..COLS).count do |column|
    next false unless schematic_grid[row][column] == PAPER_ROLL
    
    neighbors = DIRECTIONS.count do |direction_row, direction_column|
      neighbor_row = row + direction_row
      neighbor_column = column + direction_column

      if neighbor_row.between?(0, ROWS) && neighbor_column.between?(0, COLS) 
        schematic_grid[neighbor_row][neighbor_column] == PAPER_ROLL
      end
    end
    neighbors < 4
  end
end

puts "There are #{accessible_rolls} accessible rolls in total."
