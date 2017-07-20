require 'prime'

prime_array = Prime.take_while {|x| x < 10}
print prime_array

sum_prime = prime_array.inject {|sum, n| sum += n}
print sum_prime

# Prime Number - should only divisible by 1 and itself
#
# 13 - Prime Number because only 13 % 13 == 0 and 13 % 1 == 0
# 14 - Not Prime Number because 14 % 2 gives 0

# Another way without using Prime Library

# First, we check for 0 and 1, as they're not prime. 
# Then we basically just check every number less than num to see if it divides.
# However, as explained here, for every factor greater than the square root of num,
# there's one that's less, so we only look between 2 and the square root.

num = 17
Math.sqrt(num).to_i.downto(2).each {|n| return false if num % n == 0}
true
