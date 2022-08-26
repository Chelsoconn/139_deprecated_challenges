class Trinary 
  attr_accessor :string_num

  def initialize(string_num)
    @string_num = string_num
  end 

  def to_decimal 
    return 0 if string_num.match(/[a-zA-Z3-9]/)
    num_array = string_num.to_i.digits
    sum = 0
    num_array.each_with_index do |num, ind|
      sum += num * (3**ind)
    end 
    sum
  end 
end 

