module Nucleotide
	Pairs = Hash{'A' => 'T', 'C' => 'G', 'T' => 'A', 'G' => 'C'}

	def complement_of(c : Char)
		Pairs[c]
	end
end

		
