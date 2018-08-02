# Big fish algorithms
# O(n^2)
def sluggish_octopus(arr)
  return if arr.empty?
  lengths = arr.map { |el| el.length }

  longest = [lengths[0],0]

  lengths.each_with_index do |length,index|
    longest = [length,index] if length > longest[0]
  end

  arr[longest[1]]
end

# O(nlog(n))
def dominant_octopus(arr)
  arr.sort_by { |word| word.length }.last
end

# O(n)
def clever_octopus(arr)
  longest = ""
  arr.each { |word| longest = word if word.length > longest.length }
  longest
end

# Dancing Octopus Algorithms
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
   "left-up" => 7
 }

# O(n)
def slow_dance(dir,tiles_arr)
  tiles_arr.index(dir)
end

# O(1)
def constant_dance(dir,tiles_h)
  tiles_h[dir]
end
