require 'pp'

class Integer
  def prime?
    return false if self<=1
    return true  if self<4 #2 aselfd 3 are prime
    return false if self%2==0
    return true  if self<9 #we have already excluded 4,6 and 8.
    return false if self%3==0

    r=(self**1/2).floor # self rounded to the greatest integer   r so that r*r<=n
    f= 5
    while f<=r
      return false if self%f==0
      return false if self %(f+2)==0
      f=f+6
    end
    true
  end

  def factorial
    f = 1; for i in 1..self; f *= i; end; f
  end

  def reversed
    self.to_s.reverse.to_i
  end

  def palindrome?
    self.to_s == self.to_s.reverse
  end
end

def primes(file = '../primes_1_1000000.txt')
  @global_primes ||= {}
  @global_primes[file] = File.read(file).split.map(&:to_i)
end


class BinarySearch

  attr_accessor :list

  def initialize(orig)
    raise ArgumentError unless sorted?(orig)
    @list = orig
  end

  def find(n)
    a, b = 0, @list.size-1
    return false if n < @list[0] || n > @list[b]

    begin
      mid_i = ((b-a) / 2) + a
      mid_val = @list[mid_i]
      return true if mid_val == n
      if mid_val > n
        b = mid_i - 1
      else
        a = mid_i + 1
      end
    end while a<=b
    false

  end

  private

  def sorted?(orig)
    orig.each_cons(2).all? { |a,b| (a <=> b) <= 0 }
  end

end
