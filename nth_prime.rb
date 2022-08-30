class Prime 
  def self.nth(num)
    arr = [2,3]
    count = 5
    until arr.length == num 
      x = 2.upto(count-1).each_with_object([]) do |n,obj|
        obj << n if count % n ==0 
      end
      arr << count if x.length == 0 
      count += 1
    end
    arr.last
  end
end 

p Prime.nth(6)