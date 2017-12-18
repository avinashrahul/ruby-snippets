require 'pry'
def cal_arr_multi(a1, a2)
  a1_size = a1.size
  a2_size = a2.size
  @i = -1
  if a1_size > a2_size
    final_size = a2_size
  end
  output = []
  a1.each_with_index do |ele, index|
    index = index >= final_size ? reset_offset(index, final_size) : index
    output.push(ele * a2[index])
  end
  print output
end

def reset_offset(index, final_size)
   @i = @i +1
end

cal_arr_multi([1, 2, 3, 5], [3, 4])
