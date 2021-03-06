require 'pry'

# Using return
# Proc - Once you have return it will come outside of the method and never executes the other lines
def my_method
	puts "Inside Method starting"
	my_proc = Proc.new do
		puts "Inside Proc"
		return
	end
	my_proc.call
	puts "Called Proc"
end

my_method

# my_proc = lambda {|first_name, last_name| first_name '+' last_name}
# You can call this bt my_proc.call('Rahul', 'G') or my_proc['Rahul', 'G']

# Another way is
# my_proc = ->(first_name, last_name) {first_name '+' last_name}

# Lambda - Once you have return it will come outside and execute other lines like regular ruby method
def my_method
	puts "Inside Method starting"
	my_lambda = lambda do
		puts "Inside Lambda"
		return
	end
	my_lambda.call
	puts "Called Lambda"
end

my_method

# Using Break

def my_method
  puts "before proc"
  my_proc = lambda do
    puts "inside proc"
    break
  end
  my_proc.call
  puts "after proc"
end

my_method

# Recursion - Factorial

def recur_fact(num)
  if num == 0 || num == 1
    1
  else
    @num = num * recur_fact(num - 1)
  end
end
recur_fact(6)
puts @num

# Without Recusrsion - Factorial

def recur(num)
	if num == 0 || num == 1
		1
	else
		sum = 1
		num.times do |i|
			sum = sum * (i + 1)
		end
	end
		puts sum
end

recur(6)

# Factorial - Using Inject
puts (1..6).inject(:*) || 1

# Fibonacci

def fibo(n)
	if n == 0 || n == 1 || n == 2
		return 1
	else
		@fib = fibo(n-1) + fibo(n-2)
	end
end

fibo(6)
puts @fib

# Speeding up Fibonacci

def fibo_speed(n)
	@cache[n] = @cache[n] || fibo_speed(n-1) + fibo_speed(n-2)
end
@cache = {}
@cache[1] = 1
@cache[2] = 1
fibo_speed(45)
puts @cache[45]

# Ruby reverse a string wityhout .reverse

puts "Reverse This".chars.inject {|a, b| b + a}


# Fibo in one line

f = ->(n){n < 2 ? n : f[n-1] + f[n-2]}
puts f.call(10)


# Print Fibonacci series

def fibo_series(n, cache)
	return 1 if n <= 2
	return cache[n] if cache[n]
	cache[n] = fibo_series(n-1, cache) + fibo_series(n-2, cache)
end

cache = {}
puts (1..10).to_a.map {|i| fibo_series(i, cache)}
# O/P - [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# Hashes

animals =  [["dogs", 4], ["cats", 3], ["dogs", 7]]

# Output should be {"dogs"=>11, "cats"=>3}

animals.inject(Hash.new(0)) do |memo, (key, value)|
	memo[key] = memo[key] + value
	memo
end

# Monkey patch the Hash class and define a method called all_values_even? that returns true if all the values in a Hash are even.

h = {a: 2, b: 4}

class Hash
	def all_values_even?
		self.values.all? {|x| x.even?}
	end
end

puts h.all_values_even?

# Add a all_start_with_a? method to the Array class that returns true if every String element in an array starts with the letter "a".

a = ['avinash', 'algebra']

class Array
	def all_start_with_a?
		self.all? {|x| x[0] == 'a' }
	end
end

puts a.all_start_with_a?

#Add a my_map() method to the Array class that behaves the same as the Array#map method.

class Array
	def my_map
		new_arr = []
		self.each do |ele|
			new_arr << yield(ele)
		end
		new_arr
	end
end
print [1, 2, 3].my_map {|x| x * 2}


# Method Missing

class Tea
	private
	def method_missing(method_name, *args)
		puts "Sorry.. #{method_name}"
	end
end

Tea.new.red_label('sweet', 'sugar')

# Reverse a integer without .reverse or .to_s
x = 1234
y = 0
while x > 0
	z = x % 10 #4, 3, 2, 1
	y = (y * 10) + z #4, 43, 432, 4321
	x = x / 10 # 123, 12, 1, 0
end
puts y

# method 2 without using .reverse but using .to_s

array_of_nums = 123.to_s.split(//)
array_of_nums.inject {|a, b| b + a}.to_i


# Get Index value of letter 'R' from a string
s = "This is Awesome Rahul"
puts s =~ /R/

# Find all instances of integer from below string
s = "This is 10 Awesome Rahul 20"
s.to_enum(:scan, /\d+/).map {Regexp.last_match}

# Grep an element from an array
a = [2, 3, 1, 2]
puts a.grep(2) # [2,2]

# Split all evens into didfferent array from array of numbers
array = [1, 3, 2, 6, 9, 22]
print array.partition {|i| i.even?} # Output - [[2, 6, 22], [1, 3, 9]]

#
active = {2000 => 10, 2001 => 20}
inactive = { 2000 => 30, 2001 => 40, 2003 => 50}

## Output should be -
# {
# 2000 => {'active'=> 10, 'inactive'=>30},
# 2001 => {'active'=> 20, 'inactive'=>40},
# 2003 => {'inactive'=>50}
# }

[active.keys + inactive.keys].flatten.uniq.map {|k| { k =>  {'active' => active[k], 'inactive' => inactive[k]}.delete_if {|k, v| v.nil?}  }}.inject(&:merge)


