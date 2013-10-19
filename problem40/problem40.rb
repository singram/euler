# An irrational decimal fraction is created by concatenating the positive integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of the following expression.

# d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000

require 'pp'

champernowne = '0'
i = 0
while champernowne.size < 1000010
  i+=1
  champernowne += i.to_s
end

solution = 1
[1,10,100,1000,10000,100000,1000000].each do |pos|
  i = champernowne[pos].to_i
  solution *= i
end
pp solution
