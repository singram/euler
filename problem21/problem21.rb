# -*- coding: utf-8 -*-
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

require 'pp'

def sum(a)
  a.inject(&:+)
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
#      div << max if max < n
    end
    i+=1
  end
  div
end

numbers = {}
(1..10000).to_a.each do |n|
  numbers[n] = sum(divisors(n))
end

amicable_numbers = {}
numbers.each do |n, v|
  if n != v
    amicable_numbers[n] = v if numbers[v]==n && amicable_numbers[v].nil?
  end
end

pp amicable_numbers
pp sum(amicable_numbers.to_a.flatten)
