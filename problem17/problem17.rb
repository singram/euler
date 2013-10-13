# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

#   If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
STRINGS = {
  1=> 'one',
  2=> 'two',
  3=> 'three',
  4=> 'four',
  5=> 'five',
  6=> 'six',
  7=> 'seven',
  8=> 'eight',
  9=> 'nine',
  10=> 'ten',
  11=> 'eleven',
  12=> 'twelve',
  13=> 'thirteen',
  14=> 'fourteen',
  15=> 'fifteen',
  16=> 'sixteen',
  17=> 'seventeen',
  18=> 'eighteen',
  19=> 'nineteen',
  20=> 'twenty',
  30=> 'thirty',
  40=> 'forty',
  50=> 'fifty',
  60=> 'sixty',
  70=> 'seventy',
  80=> 'eighty',
  90=> 'ninety'
}

class Fixnum
  def hundreds
    (self % 1000)/100
  end

  def thousands
    (self % 10000)/1000
  end

end

require 'pp'
answer = 0
(1..1000).to_a.each do |i|
  a = []
  thousands = i.thousands
  hundreds = i.hundreds
  a << "#{STRINGS[thousands]}thousand" if STRINGS[thousands]
  a << "#{STRINGS[hundreds]}hundred" if STRINGS[hundreds]
  unless i%100 == 0
    a << "and" if i > 100
    if STRINGS[i%100]
      a << STRINGS[i%100]
    else
      a << STRINGS[((i%100)/10)*10]
      a << STRINGS[(i%10)]
    end
  end
  pp a.join
  answer += a.join.length
end

pp answer
