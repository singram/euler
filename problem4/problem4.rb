# -*- coding: utf-8 -*-
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit
# numbers.

def is_palindrome?(n)
  n.to_s == n.to_s.reverse
end

best = {:p =>0, :n1=>0, :n2=>0}

(100..999).each do |n1|
  (100..999).each do |n2|
    p = n1*n2
    if is_palindrome?(p) && best[:p]<p
      best = {:p => p, :n1 => n1, :n2 => n2}
    end
  end
end

require 'pp'
pp best
