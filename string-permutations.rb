require 'pry'
require 'set'
# # To get all permutations for a particular string like -
# pets, pest, espt, sept and so on

# we remove last character from the string and ge permutations for rest of string

# 1. like get permutatiosn for pet -> etp, pte, and so on
# 2. Add last character 's' in each above permutation array -? setp, estp, etps

# $$$$$$$$$$$ - - Running output of string "abcd":

# Step 1: Merge [a] and b: [ba, ab]
# Step 2: Merge [ba, ab] and c: [cba, bca, bac, cab, acb, abc]
# Step 3: Merge [cba, bca, bac, cab, acb, abc] and d: [dcba, cdba, cbda, cbad, dbca, bdca, bcda, bcad, dbac, bdac, badc, bacd, dcab, cdab, cadb, cabd, dacb, adcb, acdb, acbd, dabc, adbc, abdc, abcd]

def get_permutations(string)
  permutations = []
  # base case
  if string.length <= 1
    byebug
    return permutations << string
  end

  all_chars_except_last = string[0..-2]
  last_char = string[-1]

  # recursive call: get all possible permutations for all chars except last
  permutations_of_all_chars_except_last = get_permutations(all_chars_except_last)
  # put the last char in all possible positions for each of the above permutations

  permutations_of_all_chars_except_last.each do |permutation_of_all_chars_except_last|
    (0..all_chars_except_last.length).each do |position|
      permutation = permutation_of_all_chars_except_last[0...position] + last_char + permutation_of_all_chars_except_last[position..-1]
      byebug
      permutations << permutation
    end
  end

  return permutations
end

a =  get_permutations('pets')
puts a.inspect

