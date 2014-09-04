# John Watson performs an operation called Right Circular Rotation on an 
# integer array a0,a1 ... an-1. Right Circular Rotation transforms the array from a0,a1 ... aN-1 to aN-1,a0,... aN-2.

# He performs the operation K times and tests Sherlock's ability to identify 
# the element at a particular position in the array. He asks Q queries. 
# Each query consists of one integer x, for which you have to print the element ax.

# Input Format 
# The first line consists of 3 integers N, K and Q separated by a single space. 
# The next line contains N space separated integers which indicates the elements of the array A. 
# Each of the next Q lines contain one integer per line denoting x.

# Output Format 
# For each query, print the value in the location in a newline.

# Constraints 
# 1 ≤ N ≤ 105 
# 1 ≤ A[i] ≤ 105 
# 1 ≤ K ≤ 105 
# 1 ≤ Q ≤ 500 
# 0 ≤ x ≤ N-1

# The below code transforms an array into the array after n rotations 
# by realizing that right rotation merely takes the end of an array
# and prepends it, so n rotations takes the last n elements from the 
# array and prepends them.  Given that the array.length + 1th rotation
# is the same as the 1st rotation, the rotation method first takes
# the number of rotations mod length.  
#
# To answer the question, the final bit simply goes through all 
# queries and puts the corresponding value.  

input = STDIN.read.split("\n")
array = input[1].split.map(&:to_i)
rotations = input[0].split.map(&:to_i)[1]
queries = input[2..-1]

def rotate(arr, rotations = 1)
    rotations = rotations % array.length
    last = arr[-rotations..-1]
    last + arr[0..-rotations - 1]
end

array = rotate(array, rotations)
queries.each{|query| puts array[query.to_i]}