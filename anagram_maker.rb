# Reads through two words and calculates how many characters 
# must be deleted to make the two words anagrams
# e.g., "abc" and "cde" would output 4
# The algorithm finds how many

def anagram_maker(first, second)
  dictionary = Hash.new(0)
  first.each_char{|letter| dictionary[letter] += 1}
  second.each_char{|letter| dictionary[letter] -= 1}
  print dictionary.values.map{|val| val.abs}.inject(:+)
end

