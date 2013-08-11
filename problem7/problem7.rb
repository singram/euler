# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

#   What is the 10 001st prime number?

PRIMES = [2,3,5,7]
def is_prime?(n)
  PRIMES.each do |p|
    return false if n%p==0
  end
  (PRIMES.last..n/2).each do |x|
    return false if n%x == 0
  end
  PRIMES << n
  true
end

TARGET_POSITION = 10001
current = PRIMES.last
while PRIMES.size < TARGET_POSITION
  current+=1
  is_prime?(current)
end

require 'pp'
pp PRIMES.last
