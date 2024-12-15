# the first/last rows AND columns are uselss with this new way of finding xmas

# M . S
# . A .
# M . S

# 0. For each useful row/column
# 1. Find the A
# 2. Southeast: Check (x-1,y-1), if M or S then check (x+1, y+1) for the remaining remaining value
# 3. Southwest: Check (x-1, y+1), if M or S, then check (x+1, y-1) for the remaining value
# 4. Only valid if 2 && 3
WORD_SEARCH = File.read("puzzle_input.txt").split("\n").map(&:chars)

XMAS = ["MS", "SM"]

def check_southeast(row, column)
  XMAS.any?(WORD_SEARCH[row-1][column-1] + WORD_SEARCH[row+1][column+1])
end

def check_southwest(row, column)
  XMAS.any?(WORD_SEARCH[row-1][column+1] + WORD_SEARCH[row+1][column-1])
end

rows = WORD_SEARCH.size
columns = WORD_SEARCH[0].size
xmasses = 0

(1..rows-2).each do |row|
  (1..columns-2).each do |column|
    if WORD_SEARCH[row][column] == "A"
      xmasses+=1 if (check_southeast(row, column) && check_southwest(row, column))
    end
  end
end

puts "X-MAS: #{xmasses}"
