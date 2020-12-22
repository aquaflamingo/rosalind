require "file_utils"
puts FileUtils.pwd

class FastaSequence 
	property name
	property data

	def initialize(@name : String, @data : String)
	end
end

class FastaFileParser
	def parse(fpath : String)
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

class NucleotideCounter
	property sequence : String

	def initialize(seq : FastaSequence)
		@sequence = seq.data
	end

	def get_gc_content
		gc_count = @sequence.count do |c|
			c == 'C' || c == 'G'
		end

		gc_count / @sequence.size
	end

	def get_at_content
		at_count = @sequence.count do |c|
			c == 'A' || c == 'T'
		end

		at_count / @sequence.size
	end
end

puts "Fasta File:\n"
file = gets.not_nil!.chomp
seqs = FastaFileParser.new.parse(file)

puts seqs

contents = seqs.map do |seq| 
	content = NucleotideCounter.new(seq)
	{name: seq.name, gc: content.get_gc_content, at: content.get_at_content}
end

max = contents.max_by { |c| c[:gc] }

puts "Highest GC content: #{max[:name]} GC: #{max[:gc]}, AT: #{max[:at]}"

