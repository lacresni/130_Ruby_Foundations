class InvalidCodonError < StandardError; end

class Translation
  CODON_TO_ACIDS = {
    ['AUG']	=> 'Methionine',
    ['UUU', 'UUC'] =>	'Phenylalanine',
    ['UUA', 'UUG'] =>	'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] =>	'Serine',
    ['UAU', 'UAC'] =>	'Tyrosine',
    ['UGU', 'UGC'] =>	'Cysteine',
    ['UGG'] =>	'Tryptophan',
    ['UAA', 'UAG', 'UGA'] =>	'STOP'
  }

  def self.of_codon(codon)
    result = CODON_TO_ACIDS.select do |codons, _|
      codons.include?(codon.upcase)
    end

    raise InvalidCodonError if result.empty?

    result.values.first
  end

  def self.of_rna(strand)
    # Split strand into 3 chars codons
    codons = strand.scan(/.../)
    stop_translation = false

    codons.each_with_object([]) do |codon, result|
      acid = of_codon(codon)
      stop_translation = true if acid == 'STOP'
      result << acid unless stop_translation
    end
  end
end
