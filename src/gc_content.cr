require "./fasta.cr"
require "file_utils"

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
seqs = FastaFile.open(file)

puts seqs

contents = seqs.map do |seq| 
	content = NucleotideCounter.new(seq)
	{name: seq.name, gc: content.get_gc_content, at: content.get_at_content}
end

max = contents.max_by { |c| c[:gc] }

puts "Highest GC content: #{max[:name]} GC: #{max[:gc]}, AT: #{max[:at]}"

