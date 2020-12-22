input = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

count = Hash{"A" => 0, "T" => 0, "G"=> 0, "C"=> 0}

input.each_char do |c|
	 value = count[c.to_s] 
	 count[c.to_s] = value + 1
end

puts "A: #{count["A"]} T: #{count["T"]}, C: #{count["C"]}, G: #{count["G"]}"


