# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

#   Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

#   NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.


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

def is_truncatable_prime?(n)
  return false if n.to_s !~ /^[2|3|5|7].*[3|5|7]$/
  numbers = truncatable_numbers(n)
  numbers.all?{|r| is_prime?(r)}
end

def truncatable_numbers(n)
  str_size = n.to_s.length
  (1...str_size+1).collect { |i| (n.to_s)[0, i].to_i } +
  (1...str_size).collect { |i| (n.to_s)[ -i, str_size].to_i }
end


TRUNC = []

(3..1000000).step(2).each do |n|
  TRUNC << n  if is_truncatable_prime?(n)
end

p TRUNC
p TRUNC.inject(&:+)
