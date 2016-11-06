# Aufgabe 1
numbers = (15..20).to_a

# Aufgabe 1a
puts "////////////////// Aufgabe 1a //////////////////////"
numbers.each { |number|
puts number.to_s
 }

 # Aufgabe 1b
puts "////////////////// Aufgabe 1b //////////////////////"

numbers.each { |number|
puts "Index: " + numbers.index(number).to_s + " - Wert: " + number.to_s
 }

# Aufgabe 1c
puts "////////////////// Aufgabe 1c //////////////////////"

hash1 = Hash.new
numbers.each { |number|
hash1[number] = rand(100..200)
 }

# Aufgabe 1d
puts "////////////////// Aufgabe 1d //////////////////////"

hash1.each { |key, value|
puts "Index: " + key.to_s + " - Wert: " + value.to_s
 }

# Aufgabe 1e
puts "////////////////// Aufgabe 1e //////////////////////"

hash1.each { |key, value|
str = "Index: " + key.to_s + " - Wert: " + value.to_s
if value > 150
  str = str + " WOW!!!"
end
puts str
 }

 # Aufgabe 1f
puts "////////////////// Aufgabe 1f //////////////////////"
squart = []
 numbers.each { |number|
squart << Math::sqrt(number)
}

puts squart

 # Aufgabe 1f
puts "////////////////// Aufgabe 1g //////////////////////"
squartHash = {}

numbers.each { |number|
squartHash[number] = Math::sqrt(number)
}

puts squartHash