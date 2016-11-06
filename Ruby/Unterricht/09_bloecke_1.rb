puts "////////////////// Aufgabe 1.1 //////////////////////"
prim_a = Array.new([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])

puts "////////////////// Aufgabe 1.1a //////////////////////"
prim_a.each { |p|
if p < 10
  puts "#{p} ist einstellig"
elsif p < 100
  puts "#{p} ist zweistellig"
end
  }
puts "////////////////// Aufgabe 1.1c //////////////////////"
  prims = Hash.new
   prim_a.each { |p|
   if p < 10
     prims[p] = "ist einstellig"
   elsif p < 100
    prims[p] = "ist zweistellig"
   end
     }

puts "////////////////// Aufgabe 1.1d //////////////////////"
  str1 = Array.new
  prims.select {|k,v| v == "ist einstellig"}.each_key{ |e|  str1 << e }
  puts "Einstellig: " + str1.join(",")

  str2 = Array.new
  prims.reject {|k,v| v == "ist einstellig"}.each_key{ |e|  str2 << e }
  puts "Zweistellig: " + str2.join(",")

puts "////////////////// Aufgabe 1.1b //////////////////////"
person = {vorname: "Theo", name: "Sommer", stadt: "Lodz"}
puts "Person 1:"
person.each { |key, value|
puts "#{key}: #{value}"
 }
puts "////////////////// Aufgabe 1.1e //////////////////////"
persons = Array.new
i = 0
 persons << {vorname: "Theo", name: "Sommer", stadt: "Lodz"}
 persons << {vorname: "Sergej", name: "Hoffmann", stadt: "Winsen"}
 persons << {vorname: "Fabian", name: "Knoop", stadt: "Hamburg"}
persons.each { |person|
  puts
puts "Person #{i = i + 1}:"
 person.each { |key, value|
 puts "#{key.capitalize}: #{value}"
  }
}