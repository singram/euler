

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#   What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

PRIMES = [2,3,5,7]
def is_prime?(n)
  return false if n==1
  PRIMES.each do |p|
    return false if n%p==0
  end
  # (PRIMES.last..n/2).each do |x|
  #   return false if n%x == 0
  # end
  PRIMES << n
  true
end

def least_common_multiple(set)
  #http://en.wikipedia.org/wiki/Lowest_common_denominator#Non-mathematical_usage
  set.each {|n| is_prime?(n)}

  multiples = []
  PRIMES.each do |p|
    next if p == 1
    while set.any?{|s| s%p==0}
      set = set.map{|n| n%p==0 ? n/p : n}
      multiples << p
    end
  end
  multiples.inject(:*)
end

require 'pp'
NUMBERS = (1..20).to_a

pp NUMBERS.inject(:lcm)
pp least_common_multiple(NUMBERS)
