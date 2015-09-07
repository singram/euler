# -*- coding: utf-8 -*-
# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

# 9 = 7 + 2×1^2
# 15 = 7 + 2×2^2
# 21 = 3 + 2×3^2
# 25 = 7 + 2×3^2
# 27 = 19 + 2×2^2
# 33 = 31 + 2×1^2

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

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

PRIMES = []

(2..100000).each do |n|
  if is_prime?(n)
    PRIMES << n
  else
    next if n%2 == 0
    solution = nil
    PRIMES.each do |p|
      (1..1000).each do |sqr|
        res = (p + (2 * (sqr * sqr)))
        if res == n
          solution = [p, 2, sqr]
          break
        elsif res > n
          break
        end
      end
      break if solution
    end
    if solution
      p "Solution found #{n} = #{solution}"
    else
      p "No solution found for #{n}"
      break
    end
  end
end
