# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

#   What is the largest n-digit pandigital prime that exists?


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

def pandigital?(n)
  digits  = n.to_s.chars.to_a
  (1..digits.size).all?{|n| digits.include?(n)}
end

max_prime = 0

n=9

while n>1 && max_prime==0
  (1..n).to_a.permutation.map{|p| p.join.to_i}. select{|p| is_prime?(p)}.each{|p| max_prime = p if p>max_prime}
  n-=1
end

p max_prime
