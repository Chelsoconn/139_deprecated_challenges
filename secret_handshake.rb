class SecretHandshake 
  RULES = {1 => 'wink', 10 => 'double blink', 100 => 'close your eyes', 
           1000 => 'jump'}

  attr_accessor :num

  def initialize(num)
     @num = num.to_s.to_i == num.to_i ? num : 0 
  end 

  def conversion 
    arr =[]
    loop do 
      arr << num%2
      self.num = num / 2
      break if num == 0
    end 
    arr.reverse.join.to_i
  end 

  def conv_array
    binary = (num.is_a? Integer) ? conversion : num.to_i
    reverse = (binary > 10000) ? true : false 
    array = []
    binary.digits.reverse.each_with_index do |num, ind|
      if num == 1 && binary.digits[ind..-1].length < 5
        length = binary.digits[ind..-1].length-1
        array << (1*10**length)
      end 
    end 
    reverse ? array : array.reverse
  end 

  def commands
    conv_array.map do |num|
      RULES[num] 
    end 
  end
end 


