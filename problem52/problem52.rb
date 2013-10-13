# -*- coding: utf-8 -*-


# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

#   Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

require 'pp'

def order(str)
  str.to_s.chars.sort.join
end

def test(n)
  n2 = order((n*2).to_s)
  [3,4,5,6].each do |i|
    return false if order(n*i) != n2
  end
  true
end

n=1
while !test(n) do
  n+=1
  print '.' if n%1000==0
end

pp n
