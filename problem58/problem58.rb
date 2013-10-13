# -*- coding: utf-8 -*-
# Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.

# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49

# It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

# If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?

# See Problem28

# Seq1 = 1,3,7,13,21,31,43,57,73
# Seq2 = 1,5,9,17.25.37,49,65,81

require 'pp'

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

total_count = 1
prime_count = 0
size = 1
s1 = [1]
s2 = [1]

pp (prime_count.to_f*100/total_count.to_f) < 62
while prime_count==0 || (((prime_count.to_f*100/total_count.to_f) > 10) || total_count < 13)
  2.times.each do
    s1 << s1.last + 2*size
    s2 << s2.last + 4 * ((size+1)/2)
    prime_count += 1 if is_prime?(s1.last)
    prime_count += 1 if is_prime?(s2.last)
    total_count += 2
    size += 1
  end
  pp "total - #{total_count}  prime - #{prime_count} size - #{size}   #{prime_count.to_f*100/total_count.to_f}" if size % 101 == 0
#  pp s1
#  pp s2
#  pp
end

pp size
pp prime_count.to_f*100/total_count.to_f
