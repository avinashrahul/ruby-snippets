class Array
  def my_reverse
    return [] if self.empty?
    last = self.pop
    self.my_reverse
    self.unshift(last)
  end
end


print ['hello', 'world', 'great'].my_reverse



def balanced?(str)
  pairs = {'{' => '}', '[' => ']'}
  new_arr = []
  str.chars.each do |c|
    if pairs[c]
      new_arr << pairs[c]
    elsif new_arr.include?(c)
      new_arr.delete(c)
    else
      return false
    end
  end
  new_arr.empty? ? true : false
end


print balanced?('[]{}')
