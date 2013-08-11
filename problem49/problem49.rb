# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

#   There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

#   What 12-digit number do you form by concatenating the three terms in this sequence?


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

require 'pp'

primes = (1001..9999).step(2).select{|n| is_prime?(n)}

prime_sets = {}
primes.each do |p|
  key = p.to_s.chars.sort.join
  prime_sets[key]||=[]
  prime_sets[key] << p
end

solutions = []
prime_sets.each do |key, prime_set|
  while !prime_set.empty?
    n = prime_set.shift
    prime_set.each do |n1|
      diff = n1-n
      if prime_set.include?(n1+diff)
        solutions << [n, n1, n1+diff]
      end
    end
  end
end

pp solutions
