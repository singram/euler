# -*- coding: utf-8 -*-
#
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?

require 'pp'

def sum(a)
  a.inject(&:+)
end

def name_sum(n)
  sum(n.bytes.map{|c|c-96})
end

names = File.open("names.txt", "r").read.gsub(/"/,'').split(',').map(&:downcase).sort

total = 0
names.each_with_index do |name, index|
  total += (index+1) * name_sum(name)
end

pp total
