# Given a board of size M x N
# and a series of cuts along the 
# y-axis and the x-axis that must
# be made to divide the board into 
# MN individual squares, which are 
# in the format:
# 4 5 1 2 3
# 2 2 9 3 1
# the following methods will, first, 
# sort the costs/cuts in the order they 
# should be made (from most expensive to 
# least) and then, next, calculate the 
# total cost of each cut, which is 
# equal to the cost multiplied by the
# number of prior cuts it crosses + 1

# E.g., for the following input:  
# 2 1 3 1 4
# 4 1 2
# First we sort the cuts (y 4, x 4, y 3, y 2, x 2, y 1, y 1, x 1)
# Then we make them and total the cost (4 + 4*2 + 3*2 + 2*2 + 2*4 + 1*3 + 1*3 + 1*6 = 42 )


def sort_costs(y_costs, x_costs)
  x_costs.sort!
  y_costs.sort!
  order = []
  until y_costs.empty? && x_costs.empty?
    if x_costs.empty? 
        order << [y_costs.pop, "y"] 
    elsif y_costs.empty?
        order << [x_costs.pop, "x"]
    elsif y_costs.last > x_costs.last 
        order << [y_costs.pop, "y"] 
    else
        order << [x_costs.pop, "x"]
    end
  end
  order
end

def calculate_costs(order)
  y_cuts = 0
  x_cuts = 0
  total_cost = 0
  order.each do |cut|
    amt = cut[0].to_i
    if cut[1] == "x"
      x_cuts += 1
      total_cost += (y_cuts + 1) * amt
    else
      y_cuts += 1
      total_cost += (x_cuts + 1) * amt
    end
  end
  total_cost
end

y_costs = [2,1,3,1,4]
x_costs = [4,1,2]

order = sort_costs(y_costs, x_costs)
print calculate_costs(order)


