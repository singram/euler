# -*- coding: utf-8 -*-
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

require 'pp'

solution = nil
solution_max = 0
solutions = {}
p = 120
(1..1000).each do |p|
  (p/4.floor..p/2.floor).each do |h|
    min_s2 = p
    (1..h).each do |s1|
      break if s1 >= min_s2
      s2 = Math.sqrt(h**2 - s1**2)
      if s2> 0 && s2.to_i == s2 && (h+s1+s2) == p
        min_s2 = s2 if min_s2 > s2
#        pp "#{p} #{h} #{s1} #{s2}"
        solutions[p] ||= []
        solutions[p] << "P(#{p}) #{h} #{s1} #{s2}"
      end
    end
  end
  if solutions[p] && solutions[p].count > solution_max
    solution_max = solutions[p].count
    solution = p
  end
end

pp solutions[solution]
