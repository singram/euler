# -*- coding: utf-8 -*-


# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

#   How many such routes are there through a 20×20 grid?

# 2x2

# 0011
# 0101
# 0110
# 1001
# 1010
# 1100


# (2**1+2**0)*2 => 6

# (2**2+2**1+2**0)*2
# (4+2+1)*2 => 14

# Answer Squares Moves
# 2      1x1 1   2  1
# 6      2x2 4   4  2
# 20     3x3 9   6  3

require 'pp'
grid_size = 20

# http://stackoverflow.com/questions/127704/algorithm-to-return-all-combinations-of-k-elements-from-n

def factoral(n)
  (1..n).inject(&:*)
end

def combination_count(total, n)
  factoral(total)/ (factoral(total-n)* factoral(n))
end

# 40 => 20 vertical moves + 20 horizontal moves
pp combination_count(40,20)
