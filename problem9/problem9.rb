
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#   a^2 + b^2 = c^2

# For example, 3^2 + 4^2 = 5^2
#                9 + 16  = 25
#              SUM(a,b,c)= 12

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# working on the assumtion there can only be one solution
require 'pp'
(1..998).each do |a|
  (a+1..1000-a).each do |b|
    break if (a+b+b+1)>1000
    c = 1000 - a - b
    if c**2 == (b**2 + a**2)
      pp "a: #{a} b: #{b} c: #{c}"
      pp a*b*c
      exit
    end
  end
end
