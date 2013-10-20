# -*- coding: utf-8 -*-


# The first two consecutive numbers to have two distinct prime factors are:

#   14 = 2 × 7
# 15 = 3 × 5

# The first three consecutive numbers to have three distinct prime factors are:

#   644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.

#   Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?

require 'pp'
require 'benchmark'

def is_prime?(n)
  return false if n==1
  return true  if n<4 #2 and 3 are prime
  return false if n%2==0
  return true  if n<9 #we have already excluded 4,6 and 8.
  return false if n%3==0

  r=(n**1/2).floor # n rounded to the greatest integer   r so that r*r<=n
  f= 5
  while f<=r
    return false if n%f==0
    return false if n %(f+2)==0
    f=f+6
  end
  true
end

SEQ_SIZE = 4
FAC_SIZE = 4

PRIMES = []
SOLUTIONS = []
(2..1000000).each do |n|
  if is_prime?(n)
    PRIMES << n
  else
    real_n = n
    factors = []
    PRIMES.each do |p|
      if n%p==0
        factors << p
        n /= p
        redo
      end
    end
    if n == 1
      puts "P(#{real_n}) -  #{factors.uniq.size} factors = #{factors}"
      if factors.uniq.size == FAC_SIZE
        if SOLUTIONS.empty? || SOLUTIONS.last == real_n -1
          SOLUTIONS << real_n
        else
          SOLUTIONS.clear
          SOLUTIONS << real_n
        end
        break if SOLUTIONS.size == SEQ_SIZE
      end
    end
  end
end

pp SOLUTIONS
