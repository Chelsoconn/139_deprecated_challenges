class Luhn
  attr_accessor :num1

  def initialize(num)
    @num1 = num 
  end

  def addends 
    num1.digits.map.with_index do |num, ind|
      if ind.odd? 
         (num*2 > 10) ? (num*2)-9 : num*2
      else
         num 
      end
    end.reverse
  end 

  def checksum 
    addends.sum
  end 

  def valid? 
    checksum.digits[0] == 0
  end 

  def self.create(num)
    new_num = Luhn.new(num)
    arr = (0..9).to_a.each_with_object([]) do |num, obj|
      obj << (new_num.num1.digits.reverse << num).join.to_i
    end
    arr.each do |num|
      x = Luhn.new(num)
      return num if x.valid? 
    end 
  end
end 



