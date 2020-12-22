require "./nucleotide.cr"

puts "Input DNA Sequence:\n"

class DnaComplement
	extend Nucleotide

	def self.build(input : String)
		rev = input.reverse

		complement = String.build do |s|
			rev.each_char do |c|
				s << complement_of(c)
			end
		end
	end
end

dna_input = gets.not_nil!.chomp

complement = DnaComplement.build(dna_input)

puts "Input #{dna_input}, Complement #{complement}"
