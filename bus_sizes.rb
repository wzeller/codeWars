# given an input in this form: 
# 8
# 1 2 1 1 1 2 1 3
# where 8 is the number of people in a queue
# and each entry in the next line is a group that
# wants to ride together, what are the sizes of 
# bus that could (a) never have empty seats for
# each trip and (b) transport all the people without
# separating groups

# The solution(s) will be between the max group size, max_group_size,
# and the total number of people, total_people.
# Possible solutions will be the multiples of total_people
# greater than max_group_size.
# To test if a solution works, you can go through the array 
# of group sizes 

size = STDIN.read.split[0]
array = STDIN.read.split[1]

def factors(num)
  square_root = Math.sqrt(num)
  (1..square_root).flat_map do |n| 
    if num % n == 0 
      [n, num/n]
    end
  end.select{|x| !x.nil?}.sort.uniq
end

def divides_evenly(array, step)
  total = 0
  array.each do |el| 
    total += el
    if total >= step 
      total -= step 
      return false if total % step != 0
    end
  end
  total % step == 0 ? true : false
end

arr = %w(1 2 1 1 1 2 1 3).map(&:to_i)

def find_even_divisors(arr)
  max = arr.max
  factors = factors(arr.inject(:+)).select{|x| x >= max}
  solutions = []
  factors.each do |step|
    divides_evenly(arr, step) ? solutions << step : next 
  end
  solutions
end

print find_even_divisors(arr)
