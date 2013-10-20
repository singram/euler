# -*- coding: utf-8 -*-
#
# The prime 41, can be written as the sum of six consecutive primes:
#   41 = 2 + 3 + 5 + 7 + 11 + 13

# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'pp'

def sum(a)
  a.inject(&:+)
end

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

primes = []
primes_h = {}
problem_space = 1000000

(1..problem_space/10).each do |i|
  if is_prime?(i)
    primes << i
    primes_h[i]=true
  end
  print '.' if i % 10000 == 0
end

puts "\nPrimes calculated - #{primes.size}"
puts "Solution searching...."
max_sol = 0
(1..primes.size-1).to_a.reverse.each do |con_length|
  (0..primes.size-con_length).each do |offset|
    psum = sum(primes.slice(offset,con_length))
    break if psum > problem_space
    if primes_h[psum] || is_prime?(psum)
      max_sol = psum if psum > max_sol
      puts "#{psum} seq length - #{con_length}"
    end
#    pp "#{offset} #{con_length}"
  end
  break if max_sol > 0
end

pp max_sol
