class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0
    return 'deficient' if sums(num) < num 
    sums(num) == num ? 'perfect' : 'abundant'
  end 

  def self.sums(num)
    1.upto(num-1).select{|x| num % x == 0}.sum
  end 
end 


