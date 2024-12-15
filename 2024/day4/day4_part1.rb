XMAS = "XMAS"

def count_word_instances(text, debug: false)
  puts "text to search: #{text}" if debug
  regex = /#{XMAS}/
  count = text.scan(regex).count
  puts "found #{count} instances of word" if debug
  count
end

def horizontal_search(puzzle, debug: false)
  matches = puzzle.map do |row|
    count_word_instances(row.join, debug: debug) + count_word_instances(row.reverse.join, debug: debug)
  end
 #puts matches.to_s
 matches.sum
end

def vertical_search(puzzle)
  transposed_puzzle = puzzle.transpose

  #puts "transposed puzzle, now searching vertically"
  horizontal_search(transposed_puzzle)
end

def diagonal_search(matrix)
  size = matrix.length
  southest_diagonals = []
  southwest_diagonals = []

  # Loop through all possible diagonals
  (-(size - 1)..(size - 1)).each do |k|
    southeast = []
    southwest = []

    (0...size).each do |i|
      # Calculate indices for both southeast and southwest diagonals
      j_southeast = i + k
      j_southwest = size - 1 - i - k

      # Check if the indices are within bounds for southeast diagonal
      if j_southeast >= 0 && j_southeast < size
        southeast << matrix[i][j_southeast]
      end

      # Check if the indices are within bounds for southwest diagonal
      if j_southwest >= 0 && j_southwest < size
        southwest << matrix[i][j_southwest]
      end
    end

    # Add to list of diagonals
    southest_diagonals << southeast unless southeast.empty?
    southwest_diagonals << southwest unless southwest.empty?
  end

  horizontal_search(southest_diagonals) + horizontal_search(southwest_diagonals)
end

word_search = File.read("puzzle_input.txt").split("\n").map(&:chars)

if word_search.size != word_search[0].size
  puts "puzzle is not a matrix, FAIL"
end

h_matches = horizontal_search(word_search)
puts "horizontal matches: #{h_matches}"
v_matches = vertical_search(word_search)
puts "vertical matches: #{v_matches}"
d_matches = diagonal_search(word_search)
puts "diagonal matches: #{d_matches}"

puts "total: #{h_matches+v_matches+d_matches}"
