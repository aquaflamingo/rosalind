def hamming_distance(seq1 : String, seq2 : String)
	 seq2_chars = seq2.chars

	 count = 0

	 seq1.each_char_with_index do |c, i|
			count += 1 if c != seq2_chars[i]
	 end

	 return count
end

puts "Enter Sequence One:\n"
seq1 = gets.not_nil!.chomp

puts "Enter Sequence Two:\n"
seq2 = gets.not_nil!.chomp

distance = hamming_distance(seq1, seq2)

puts "Hamming Distance: #{distance}"
