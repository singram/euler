# -*- coding: utf-8 -*-
#
# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
#
#                               Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'pp'

def sum(a)
  a.inject(&:+) || 0
end

def divisors(n)
  max = n
  i = 1
  div = []
  while i < max
    if n%i==0
      max = n/i
      div << i
      div << max if max < n && max != i
    end
    i+=1
  end
  div
end

def abundant?(n)
  sum(divisors(n)) > n
end

def sum_of_abundants?(n, abundants)
  abundants.keys.each do |a|
    return true if abundants[n-a]
    return false if n-a < 12
  end
  false
end

abundants = {}
(1..28123).to_a.each do |n|
  abundants[n] = true if abundant?(n)
end

pp 'Abundants calculated'

non_sumable=[]
(1..28123).each do |n|
  non_sumable << n unless sum_of_abundants?(n, abundants)
  print '.' if n%100 == 0
end

pp non_sumable
pp sum(non_sumable)
