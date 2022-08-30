class PigLatin
   EDGES = ['ch', 'th', 'squ', 'qu', 'sh', 'thr', 'sch']

  def self.translate(word)
    word.split.length > 1 ? sep(word) : each_word(word)
  end

  def self.each_word(word)
    char = word.chars
    if char[0].match(/[aeiou]/) || (char[0].match(/[xy]/) && !char[1].match(/[aeiou]/))
      x = char[0..-1] << 'ay'
    else 
      pref = EDGES.select {|edge| word.start_with?(edge)}
      if pref.empty? 
        x = char[1..-1] << char[0] << 'ay'
      else   
        l = pref.max_by(&:length).length 
        x = char[(l)..-1] << char[0..l-1] << 'ay'
      end
    end 
    x.join
  end 

  def self.sep(words)
    x = words.split.each_with_object([]) do |word, obj|
      obj << each_word(word) 
    end
    x.join(' ')
  end 
end 

