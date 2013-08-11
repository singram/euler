# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include leading zeros.)


s = (1..1000000).select{|n| n.to_s == n.to_s.reverse && n.to_s(2) == n.to_s(2).reverse}
p s
p s.inject(&:+)
