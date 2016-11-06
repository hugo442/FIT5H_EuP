# Aufgaeb 2a
obst = ["Pflaume", "Bauschaum", "Auster"]

# Aufgabe 2b
puts "////////////////// Aufgabe 2b //////////////////////"
a = obst.select { |str| str =~ /aus/i }
a.each { |e|
puts e
 }

puts "////////////////// Aufgabe 2c //////////////////////"
 puts obst.sort { |a, b| a.size <=> b.size }

puts "////////////////// Aufgabe 2d //////////////////////"
h = Hash.new
 a = obst.keep_if { |str| str =~ /aus/i }
 a.each { |e|
 h[e] = e.size
  }
puts h.to_s