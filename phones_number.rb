class PhoneNumber
  attr_accessor :num

  def initialize(num)
    @num = num.chars.select{|char| char.match(/[a-zA-Z0-9]/)}
  end 

  def area_code 
    return num[0..2].join if valid_num
  end 

  def number 
    num.shift if num[0] == '1' && num.length == 11
    return '0000000000' if !valid_num
    num.join
  end 

  def to_s
    self.num = number.chars
    num.unshift('(')
    num.insert(4, ') ')
    num.insert(8, '-').join
  end 

  private

  def valid_num 
    num.length == 10 && num.all?{|x| x.to_i.to_s == x.to_s} 
  end 
  
end 

