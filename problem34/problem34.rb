# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

FACTORALS = {'0' => 1}

def factoral(n)
  f = 1
  (1..n).each{|i| f*=i}
  f
end

def sum(a)
  a.inject(&:+)
end

def solution?(n)
  sum(n.to_s.split(//).map{|i| FACTORALS[i]}) == n
end

(1..9).each{|n| FACTORALS[n.to_s] = factoral(n) }

require 'pp'

# i = 1
# num = '9'
# while (num.to_i < FACTORALS['9']*i) do
#   i+=1
#   num += '9'
# end
# pp i # Maximal digit size of search space

solutions = []
(3..9999999).each do |n|
  solutions << n if solution?(n)
end

pp solutions
pp sum(solutions)
