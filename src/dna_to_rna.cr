dna = "GATGGAACTTGACTACGTAAATT"

rna = String.build do |rna|
  dna.each_char do |c|
    rna << if c == 'T'
      'U'
    else
      c
    end
  end
end

puts "RNA translation: #{rna}"
