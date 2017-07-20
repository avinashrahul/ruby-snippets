# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
# how many letters would be used?
#
#
# Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.


# We need to require humanize library to do this

require 'humanize'
number_in_words = (1..200).to_a.map(&:humanize)
new_array = []
# delete spaces and hyphens
no_space_array = number_in_words.each {|word| new_array << word.delete(" ").delete("-")}

total = 0
no_space_array.each {|w| total = total + w.length} # Sum up the length
puts total
