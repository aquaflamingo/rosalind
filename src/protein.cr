class AminoAcid
	 property name
	 property letter
	 property short

	 def initialize(@name : String,
				 @letter : String,
				 @short : String)
	 end

	 def self.from_codon(codon : String)
			TranslationHelper.find_amino_acid(codon)
	 end
end

AminoAcids = Hash{
	 arg: AminoAcid.new("Arginine", "R", "Arg"),
	 his: AminoAcid.new("Histidine", "H", "His"),
	 lys: AminoAcid.new("Lysine", "K", "Lys"),
	 asp: AminoAcid.new("Aspartic Acid", "D", "Asp"),
	 glu: AminoAcid.new("Glutamic Acid", "E", "Glu"),
	 ser: AminoAcid.new("Serine", "S", "Ser"),
	 thr: AminoAcid.new("Threonine", "T", "Thr"),
	 asn: AminoAcid.new("Asparagine", "N", "Asn"),
	 gln: AminoAcid.new("Glutamine", "Q", "Gln"),
	 cys: AminoAcid.new("Cysteine", "C", "Cys"),
	 sec: AminoAcid.new("Selenocysteine", "U", "Sec"),
	 gly: AminoAcid.new("Glycine", "G", "Gly"),
	 pro: AminoAcid.new("Proline", "P", "Pro"),
	 ala: AminoAcid.new("Alanine", "A", "Ala"),
	 ile: AminoAcid.new("Isoleucine", "I", "Ile"),
	 leu: AminoAcid.new("Leucine", "Leucine", "Leu"),
	 met: AminoAcid.new("Methionine", "M", "Met"),
	 phe: AminoAcid.new("Phenylalanine", "F", "Phe"),
	 trp: AminoAcid.new("Tryptophan", "W", "Trp"),
	 tyr: AminoAcid.new("Tyrosine", "Y", "tyr"),
	 val: AminoAcid.new("Valine", "V", "Val")
}

class TranslationHelper
	 Triplets = ['U','C','A','G'].permutations(3).freeze

	 def self.valid_codon?(codon : String)
			Triplets.include?(codon)
	 end

	 def self.find_amino_acid(codon : String)
			raise ArgumentError.new("#{codon} is not a valid codon") unless valid_codon?(codon)

			case triplet
			when "UUU", "UUC"
				 AminoAcids[:phe]
			when "UUA", "UUG",
				 AminoAcids[:leu]
			when "UCU", "UCC", "UCA", "UCG"
				 AminoAcids[:ser]
			when "UAU", "UAC"
				 AminoAcids[:tyr]
			when "UGU", "UGC"
				 AminoAcids[:cys]
			when "UGG"
				 AminoAcids[:trp]
			when "CUU", "CUC", "CUA", "CUG",
				 AminoAcids[:leu]
			when "CCU", "CCC", "CCA", "CCG"
				 AminoAcids[:pro]
			when "CAU", "CAC"
				 AminoAcids[:his]
			when"CAA", "CAG"
				 AminoAcids[:gln]
			when "CGU", "CGC", "CGA", "CGC"
				 AminoAcids[:arg]
			when "AUU", "AUC", "AUA"
				 AminoAcids[:ile]
			when "AUG"
				 AminoAcids[:met]
			when "ACU", "ACC", "ACA", "ACG"
				 AminoAcids[:thr]
			when "AAU", "AAC"
				 AminoAcids[:asn]
			when "AAA", "AAG"
				 AminoAcids[:lys]
			when "AGU", "AGC"
				 AminoAcids[:ser]
			when "AGA", "AGG"
				 AminoAcids[:arg]
			when "GUU", "GUC", "GUA", "GUG"
				 AminoAcids[:val]
			when "GCU", "GCC", "GCA", "GCG"
				 AminoAcids[:ala]
			when "GAU", "GAC"
				 AminoAcids[:asp]
			when "GAA", "GAG"
				 AminoAcids[:glu]
			when "GGU", "GGC", "GGA", "GGG"
				 AminoAcids[:gly]
			else
				 raise ArgumentError.new("#{codon} encodes stop codon")
			end
	 end
end


