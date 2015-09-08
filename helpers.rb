require 'pp'
class Integer
  def prime?
    return false if self==1
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
