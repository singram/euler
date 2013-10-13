# -*- coding: utf-8 -*-

# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#
#  1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
#  By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

require 'pp'

def sum(a)
  a.inject(&:+)
end

def name_sum(n)
  sum(n.bytes.map{|c|c-64})
end

def triangle(n)
  ((n+1)*n)/2
end

names = File.open("words.txt", "r").read.gsub(/"/,'').split(',')

names = names.map{|name| name_sum(name)}

last_triangle = 0
triangles = {}
while last_triangle < names.max
  last_triangle = triangle(triangles.values.size + 1)
  triangles[last_triangle] = true
end

pp names.select{|name| triangles[name]}.size
