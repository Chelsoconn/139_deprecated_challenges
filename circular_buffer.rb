class CircularBuffer
  class BufferEmptyException < StandardError ;end 
  class BufferFullException < StandardError ;end 
  attr_accessor :buffer, :num 

  def initialize(num)
    @num = num 
    @buffer = []
  end 

  def clear 
    self.buffer = [] 
  end 
  
  def write!(string)
    buffer.shift if (buffer.length + 1) > num && string
    write(string) if string 
  end 

  def write(string)
    raise BufferFullException if (buffer.length + 1) > num 
    buffer << string if string 
  end 

  def read
    raise BufferEmptyException if buffer.empty? 
    buffer.shift 
  end 
end 
