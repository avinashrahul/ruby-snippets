require 'pry'
class NumberToWord
  def initialize
    @number_words = {
        90 => "ninety",   80 => "eighty",   70 => "seventy",
        60 => "sixty",    50 => "fifty",    40 => "forty",
        30 => "thirty",   20 => "twenty",   19 => "nineteen",
        18 => "eighteen", 17 => "seventeen",16 => "sixteen",
        15 => "fifteen",  14 => "fourteen", 13 => "thirteen",
        12 => "twelve",   11 => "eleven",   10 => "ten",
        9  => "nine",     8  => "eight",    7  => "seven",
        6  => "six",      5  => "five",     4  => "four",
        3  => "three",    2  => "two",      1  => "one",
    }
  end

  def convert(number)
    number = number.to_i
    if @number_words.include?(number)
      return @number_words[number]
    elsif(100..999).include?(number)
      #722
      number_to_hundreds(number)
    elsif(1000..9999).include?(number)
      a = @number_words[number/1000]
      [a, 'thousand', number_to_hundreds(number%1000)].join(' ').strip
    else
      number_to_tens(number)
    end
  end

  def number_to_tens(number)
    return @number_words[number] if @number_words.include?(number)
    a = @number_words[(number%100 - number % 10)]
    c = @number_words[number%10]
    [a, '',  c].join(' ').strip
  end

  def number_to_hundreds(number)
    return number_to_tens(number%100) if number.to_s.length < 3
    [@number_words[number/100], 'hundred', number_to_tens(number%100)].join(' ').strip
  end
end

n = NumberToWord.new
puts n.convert('0100')
puts n.convert('0999')
puts n.convert('3456')
puts n.convert('9876')
puts n.convert('9890')
