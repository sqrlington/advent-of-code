input = File.open("day6.txt")

window = []
i = 0

while char = input.getc
  if window.size >= 14
    if window[i..window.size].uniq.size == 14
      puts window.size
      return
    end
    i+=1
  end
  window.push(char)
end

input.close
