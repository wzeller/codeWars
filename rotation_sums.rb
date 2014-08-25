# Given an input in the form: 

# 3
# 20 30 10 

# Where the second line is an array, the problem is to find the 
# rotation of the array with the highest weighted average.  
# For example, above, the first rotation is 20 + 60 + 30 or 110;
# the second is 30 + 20 + 60 or 110; and the third is 10 + 40 + 90 or 140.
# The correct program would return 140.

# My steps below. 


# Process input to extract the ARRAY, TOTAL, and SIZE of array into global variables.
# Helper method to calculate the pmean of an array (only used the first time)
# Helper method to calculate next pmean given prev pmean, size, sum of array and prev rotation's first el
# Method to find max_pmean, which calculates first pmean, and continues shifting off each element of the 
# array and calculating the next_pmean, comparing it to the curr_max and moving to the next, until every 
# el is visited, returning the max.  

# The problem is trivial if you calculate the entire pmean for every rotation, but that runs in O(n^2) time.
# By solving the next_pmean algebraically, the problem is reduced to linear time.  

ARRAY = STDIN.read.split[1..-1].map(&:to_i)
TOTAL = ARRAY.inject(:+)
SIZE = ARRAY.size

def pmean(arr)
    mean = 0
    arr.each_with_index{|el, idx| mean += (el * (idx + 1))}
    mean
end

# if arr = [A, B, C]
# pmean(arr) = (A + 2B + 3C)
# thus pmean([B, C, A]) = pmean(arr) - (A + B + C) + arr.size * A

def next_pmean(pmean, size, total, first)
    pmean - total + first * size
end

def pmean_max(arr)
    max = pmean(arr)
    curr_pmean = max 
    arr.size.times do 
        curr_pmean = next_pmean(curr_pmean, SIZE, TOTAL, arr.shift)
        max = curr_pmean if curr_pmean > max
    end
    max
end

p pmean_max(ARRAY)
