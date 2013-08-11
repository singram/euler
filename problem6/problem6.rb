# -*- coding: utf-8 -*-


# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385

# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 552 = 3025

# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

#   Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

MAX=100

NUMBERS = (1..MAX)

sqr_sum=NUMBERS.map{|n| n*n}.inject(:+)
sum_sqr=NUMBERS.inject(:+)*NUMBERS.inject(:+)

require 'pp'
pp sum_sqr - sqr_sum
