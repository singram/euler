# -*- coding: utf-8 -*-
# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

require 'pp'


def test(n)
  n2 = n**2
  return false unless n2 > 1000000000000000000
  return false unless n2 < 2000000000000000000
  return true if n2.to_s =~ /^1.2.3.4.5.6.7.8.9.0$/
  false
end

pp Math.sqrt(1020304050607080900)
n = 1010101010
while !test(n)
  n+=10
  print '.' if n%100000 == 0
end

pp n
