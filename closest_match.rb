# def binsert(arr, target, from = 0, to = arr.length-1)
#   mid = (from + to) /2
#   return [to, to + 1] if target > arr[to]
#   return [from - 1, from] if target < arr[from]
#   return nil if arr[mid] == target
#   return binsert(arr, target, 0, mid) if arr[mid] > target
#   return binsert(arr, target, mid+1, to) if arr[mid] < target
# end

# p binsert([1,2,3, 7, 8], 0)


ARRAY = %w[38 50 60 30 48].map(&:to_i).sort
RANGE_ARRAY_START = 23
RANGE_ARRAY_END = 69

def binsert(arr, target, from = 0, to = arr.length-1)
  mid = (from + to) /2
  return [to, to + 1] if target > arr[to]
  return [from - 1, from] if target < arr[from]
  return nil if arr[mid] == target
  return binsert(arr, target, 0, mid) if arr[mid] > target
  return binsert(arr, target, mid+1, to) if arr[mid] < target
end

closest = []
num_insert = RANGE_ARRAY_START
finish = RANGE_ARRAY_END

while num_insert < finish 
    index = binsert(ARRAY, num_insert)
    max = 0
    next if index.nil?
    if index[0] == -1 || index[0] == ARRAY.length - 1

            closest << [(ARRAY[0] - num_insert).abs, num_insert] if (ARRAY[0] - num_insert).abs >= max

    else 
            closest << [[(ARRAY[index[0]] - num_insert).abs, (ARRAY[index[1]] - num_insert).abs].min, num_insert] if 
                [(ARRAY[index[0]] - num_insert).abs, (ARRAY[index[1]] - num_insert).abs].min >= max 
    end
    p num_insert += 1
end

max = closest.sort[-1][0]
print closest.select{|x| x[0] == max}.sort.first[1]

