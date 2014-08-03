#Simple calculator class that can evaluate simple arithetic in chained calls, e.g., 
#"Calc.new.one.plus.nine" will return 10.  

class Calc  
  
  def initialize(expression = "")
    @expression = expression
  end
  
  def method_missing(method)
    method = method.to_s
    nums = %w[zero one two three four five six seven eight nine]
    operations = {"plus" => "+", "minus" => "-", "divided_by" => "/", "times" => "*"}
    @expression += nums.index(method).to_s if nums.index(method)
    @expression += operations[method] unless operations[method].nil?
    
    #Return a new instance with a built-up expression if incomplete, otherwise
    #return the answer.

    @expression.length < 3 ? self : eval(@expression)
  end 

end

