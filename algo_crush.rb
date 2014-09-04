# This code reads input of the form: 
# 5 3
# 1 2 100
# 2 5 100
# 3 4 100
# The first line contains a range and no. of test cases
# The next lines are starting and ending points of a range and the amount to add to each (k).

# The code below constructs an array of size "range".
# Then it processes each range and adds k to the start element of the range and subtracts k
# from the element after the range.  So, above, the array constructed will look like this (step-by-step):
# (1) [0,0,0,0,0]
# (2) [100, 0, -100, 0, 0]
# (3) [100, 100, -100, 0, 0]
# (4) [100, 100, 0, 0, -100]
# 
# The result is an array that will tell you the value up to that point by adding up all values 
# to that point.  So, above, the array is:
# [100, 200, 200, 200, 100].
# The max of this array is the highest value.

input = STDIN.read.split("\n")
range = input[0].split.first.to_i
tests = input[1..-1].each_slice(3).to_a.flatten.map{|slice| slice.split.map(&:to_i)}
range_array = Array.new(range, 0)
tests.each do |test|
  range_array[test[0]-1] += test[2]
  unless range_array[test[1]].nil? 
    range_array[test[1]] -= test[2]
  end
end

max = 0
total = 0
range_array.each do |val|
    total += val
    max = total if total > max
end
p max