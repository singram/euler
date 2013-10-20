# -*- coding: utf-8 -*-
# A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.

#   For example,

# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

# Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.

#   How many starting numbers below ten million will arrive at 89?

require 'pp'

def sqr_digits(n)
  sqr = 0
  while(n>0)
    sqr += (n%10)**2
    n /= 10
  end
  sqr
end


sols = {}
(1..10000000).each do |n|
  seq = [n]
  while !sols[n] && n != 1 && n != 89
    seq << n
    n = sqr_digits(n)
  end

  seq_end = sols[n] ? sols[n] : n
  seq.each { |s| sols[s] = seq_end }
  puts '.' if n%100000 == 0
end

c = 0
sols.each{ |k,v| c+=1 if v == 89}
pp c
