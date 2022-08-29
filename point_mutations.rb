class DNA 
  attr_accessor :sequence

  def initialize(sequence)
    @sequence = sequence.chars
  end 
 
  def hamming_distance(sequence_2)
    zipped = @sequence.zip(sequence_2.chars).reject{|x| x.include? nil}
    zipped.select{|ar| ar.uniq.count == 2}.count 
  end 
end 
