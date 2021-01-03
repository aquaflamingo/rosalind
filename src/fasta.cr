class FastaSequence 
	property name
	property data

	def initialize(@name : String, @data : String)
	end
end

class FastaFile
	 def self.open(fpath : String)
		filedata = File.read(fpath)
		fastas = filedata.split(">")

		f : Array(FastaSequence | Nil) = fastas.map do |fasta|
			fasta_seq = fasta.split('\n')
			name = fasta_seq.first
			seq = fasta_seq[1..-1].join("")

			next if name.empty? || seq.empty?

			FastaSequence.new(name, seq)
		end

		f.compact
	end
end


