class Sieve
  attr_accessor :num, :nums, :array

  def initialize(num)
    @num = num 
    @nums = 2.upto(num).to_a
    @array = []
  end

  def primes
    @nums.each do |number|
      (number).upto(num).to_a.each do |n|
        @array << n if n != number && n % number == 0 && !@array.include?(n)
      end
    end 
    @nums - @array  
  end 
end 

