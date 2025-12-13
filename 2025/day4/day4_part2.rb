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

PAPER_ROLL = '@'

# returns an array of coordinates of accessible paper rolls in the provided schematic grid
def find_accessible_paper_rolls(grid)
  rows = grid.size - 1
  cols = grid[0].size - 1
  accessible_rolls = []

  (0..rows).count do |row|
    (0..cols).count do |column|
      next false unless grid[row][column] == PAPER_ROLL
      
      neighbors = DIRECTIONS.count do |direction_row, direction_column|
        neighbor_row = row + direction_row
        neighbor_column = column + direction_column

        if neighbor_row.between?(0, rows) && neighbor_column.between?(0, cols) 
          grid[neighbor_row][neighbor_column] == PAPER_ROLL
        end
      end
      accessible_rolls << [row, column] if neighbors < 4
    end
  end
  accessible_rolls
end
schematic_grid = File.open("puzzle_input.txt").readlines.map(&:strip).map(&:chars)
total_removed = 0

loop do
  to_remove = find_accessible_paper_rolls(schematic_grid)
  break if to_remove.empty?
  to_remove.each do |row, column|
    schematic_grid[row][column] = '.'
  end
  total_removed += to_remove.size
end


puts "Total removed: #{total_removed}"
