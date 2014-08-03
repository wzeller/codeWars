#Ceasar cipher that rotates lowercase and capital letters by 13 and leaves
#other characters as is.

def rot13(str)
  str.each_char.map do |c|
    if c.ord <= 122 && c.ord >= 97 
      (((c.ord - 97 + 13) % 26) + 97).chr 
    elsif c.ord <= 90 && c.ord >= 65 
      (((c.ord - 65 + 13) % 26) + 65).chr
    else
      c
    end
  end.join
end

