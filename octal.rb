class Octal 

  def initialize(n)
    @n = n
  end 
  
  def to_decimal 
    return 0 if @n.match(/[a-zA-Z8-9]/)
    num = @n.to_i.digits
    sum = 0
    num.each_with_index {|n, ind| sum += n * (8**ind)}
    sum
  end
end 

