# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

#   1634 = 1^4 + 6^4 + 3^4 + 4^4
#   8208 = 8^4 + 2^4 + 0^4 + 8^4
#   9474 = 9^4 + 4^4 + 7^4 + 4^4

# As 1 = 1^4 is not a sum it is not included.

#   The sum of these numbers is 1634 + 8208 + 9474 = 19316.

#   Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

pwr = 5

numbers = {}
(1..9).map{|n| numbers[n.to_s] = n**pwr  }
numbers["0"] = 0

powers = []
(2..(9**pwr)*6).each do |n|
  parts = n.to_s.chars.to_a
  sum = parts.map{|p| numbers[p]}.inject(&:+)
  powers << n if n == sum
end

p powers
p powers.inject(&:+)
