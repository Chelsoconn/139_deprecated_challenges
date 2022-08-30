class School
  attr_accessor :hash
  def initialize 
    @hash = {}
  end 
  
  def to_h 
    hash.sort.to_h
  end 
  
  def add(value, key)
    hash[key] << value if hash[key]
    hash[key] = [value] if !hash[key]
    hash[key].sort!
  end 

  def grade(num)
    return [] if !hash[num]
    hash[num]
  end 
end 


