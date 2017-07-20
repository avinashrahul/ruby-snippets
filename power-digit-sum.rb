# # 4 power 4 and sum them
# so 4 ** 4 = 256 and 2 + 5 + 6 = 13 should be the Output
num_array = (4 ** 4).to_s.split(//)
num_array.map(&:to_i).inject(:+)
