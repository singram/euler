# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?


def is_prime2?(n)
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


def find_max_prime_factor(n)
  (3..n/3).step(2).each do |n1|
    return n/n1 if n%n1 == 0 && is_prime2?(n/n1)
  end
end

NUMBER = 600851475143

require 'pp'
pp find_max_prime_factor(NUMBER)
