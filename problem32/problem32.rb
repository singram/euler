# -*- coding: utf-8 -*-
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

def pandigital?(n)
  return false if n.size != 9
  return false if n =~ /0/
  return false if n.split('').uniq.size != 9
  true
end

products = []
(1..98).each do |a|
  (1..4987).each do |b|
    if pandigital?("#{a}#{b}#{a*b}")
      products << a*b
      p "#{a} * #{b} = #{a*b}"
    end
  end
end

p products.uniq.inject{|sum,x| sum + x }
