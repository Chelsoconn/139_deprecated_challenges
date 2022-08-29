class Anagram

  def initialize(word)
    @word = word 
  end 

  def anagrams 
    @word.chars.permutation.to_a.map {|el| el.join.downcase}
  end 

  def match(new_array)
    x = new_array.select {|el| anagrams.include?(el.downcase)}
    x.reject{|el| el.downcase == @word.downcase}
  end 

end 
