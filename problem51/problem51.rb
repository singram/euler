# By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

#   By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.

#   Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

require '../helpers.rb'

LEN = 6
p 'Generating prime list'
SET = (10**(LEN-1)..10**(LEN)).select{ |n| n.prime? }

# Number of wildcards
p 'Computing wildcard sets'
set = SET.map{|n| n.to_s}
res = {}
(1..LEN-1).each do |wild_count|
  # Permuations of wildcards within string
  wild_permutations = (0..LEN-1).to_a.combination(wild_count).to_a
#  pp wild_count
#  pp wild_permutations
  wild_permutations.each do |wild_indexes|
    set.each do |member|
      next if wild_indexes.map{ |i| member[i] }.uniq.size > 1
      w_member = member.dup
      wild_indexes.each{|i| w_member[i]='*'}
      res[w_member] ||= []
      res[w_member] << member
    end
  end
end
# pp res

# Invert results by membership
p 'Computing largest set membership'
inv = {}
res.each do |k,v|
  inv[v.size] ||= []
  inv[v.size] << k
end
pp max_members = inv.keys.max
pp inv[max_members]
pp inv[max_members].map{|wild| res[wild].min}.min

# p set
