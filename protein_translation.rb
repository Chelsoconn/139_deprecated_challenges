class InvalidCodonError < StandardError ;end

class Translation
  AMINO_HASH = {['AUG'] => 'Methionine', ['UUU', 'UUC'] => 'Phenylalanine', 
                ['UUA', 'UUG'] => 'Leucine', ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
                ['UAU', 'UAC'] => 'Tyrosine', ['UGU', 'UGC'] => 'Cysteine', 
                ['UGG'] => 'Tryptophan', ['UAA', 'UAG', 'UGA'] => 'STOP'}

  def self.of_codon(codon) #three letter string 'AUG'
    AMINO_HASH.each do |code, amino|
      return amino if code.include?(codon)
    end 
  end 

  def self.of_rna(strand) #long string 'AUGUUUUUGG'
    raise InvalidCodonError if strand.match(/[^AUG]/)
    threes = strand.chars.each_slice(3).to_a.map{|x| x.join}
    threes.each_with_object([]) do |codon,obj|
      return obj if Translation.of_codon(codon) == 'STOP'
      obj << Translation.of_codon(codon) 
    end 
  end 
end 

