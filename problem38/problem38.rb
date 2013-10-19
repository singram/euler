# -*- coding: utf-8 -*-
# Take the number 192 and multiply it by each of 1, 2, and 3:

#   192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576

# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

#   What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

require 'pp'

def pandigital?(n)
  digits = n.to_s.chars.to_a
  (1..9).all?{|n| digits.include?(n.to_s)}
end

sol = 0
(1..999999).each do |p|
  psol = p.to_s
  (2..9).each do |n|
    psol += (n*p).to_s
    break if psol.size > 9
    if psol.size == 9 && pandigital?(psol) && psol.to_i > sol
      sol = psol.to_i
      pp "P(#{p}) n - #{n}"
    end
  end
end

pp sol
