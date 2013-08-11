#  The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#  There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#  How many circular primes are there below one million?


def is_prime?(n)
  return true if CIRC[n]
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

CIRC = {2 => true}

def is_circular_prime?(n)
  return true if CIRC[n]
  return false if n.to_s =~ /2|4|6|8|0/
  numbers = circular_numbers(n)
  circ = numbers.all?{|r| is_prime?(r)}
  numbers.each{|cn| CIRC[cn]=true} if circ
  circ
end

def circular_numbers(n)
  (0...n.to_s.length).collect { |i| (n.to_s * 2)[i, n.to_s.length].to_i }
end


circ_primes = [2]
(3..100).step(2).each do |n|
 is_circular_prime?(n)
end

require 'pp'
pp CIRC
pp CIRC.size
