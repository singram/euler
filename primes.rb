require './helpers.rb'
(1..1000000).each{|n| p n if n.prime?}
