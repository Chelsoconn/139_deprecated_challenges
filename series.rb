class Series
  attr_accessor :num

  def initialize(num)
    @num = num 
  end 

  def slices(size)
    arr = num.chars.map{|x| x.to_i}
    raise ArgumentError if size > arr.size 
    new = []
    arr.each_with_index do |num, ind|
        new << arr[ind,size] if ind <= arr.size - size 
    end 
    new 
  end 
end 


