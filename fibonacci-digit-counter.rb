# Hence the first 12 terms will be:
#
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

def finonacci_digit_counter
  arr_index = -1
  num2 = 0
  i = 1

  while i.to_s.length < 10
    arr_index = arr_index + 1
    i, num2 = num2, num2 + i
  end
  arr_index
end

p finonacci_digit_counter
