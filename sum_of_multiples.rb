class SumOfMultiples
  attr_accessor :multiples 

  def initialize(*nums)
    @multiples = *nums 
  end 

  def self.to(num)
    new(3,5).to(num)
  end

  def to(num)
    new_array = []
    arr = (1...num).to_a.each do |num|
      multiples.each do |num_2|
        new_array << num if num % num_2 == 0
      end 
    end 
   new_array.uniq.sum
  end 
end 


