# Returns an array with all n rows of Pascal's Triangle.  

def pascalsTriangle(nrows)
   return [1] if n == 1
   one_smaller = pascalsTriangle(n-1)
   length = one_smaller.length 
   last_row = one_smaller.drop(length-(n-1))
   new_row = [1]
   last_row.each_with_index do |el, idx| 
     idx == last_row.length - 1 ? new_row.push(1) : new_row.push(el + last_row[idx+1])
   end
   one_smaller + new_row
end
