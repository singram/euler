# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

require 'pp'
MAX = 1000

seq1 = (3..MAX-1).step(3).to_a
seq2 = (5..MAX-1).step(5).to_a.select{|n| n%3!=0}

sum1 = seq1.inject(0){|sum,item| sum + item}
sum2 = seq2.inject(0){|sum,item| sum + item}

pp sum1+sum2
