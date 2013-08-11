# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

#   Find the sum of all the primes below two million.

require 'pp'

# PRIMES = [2,3,5]
# def is_prime?(n)
#   PRIMES.each do |p|
#     return false if n%p==0
#   end
#   # (PRIMES.last..n/2).step(2).each do |x|
#   #   return false if n%x == 0
#   # end
#   PRIMES << n
#   true
# end

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


prime_sum = 0
(3..2000000).step(2).each do |n|
  pp n if n%10001 == 0
  prime_sum += n if is_prime?(n)
end

pp prime_sum
