zahlen = (1..49).to_a
lotto_today = zahlen.shuffle.first(7)

lotto = {"Peter" => zahlen.shuffle.first(7), "Paul" => zahlen.shuffle.first(7), "Mary" => zahlen.shuffle.first(7)}

puts "Die aktuellen Gewinnzahlen vom Lotto: " + lotto_today.sort.join(" ")

lotto.each { |k, v|
puts "Die Zahlen der Teilnehmer: #{k} - #{v.sort.join(" ")}"
 }