str_1 = "Programmieren,Federball,Whisky"
str_2 = "Fussball,Bier,Programmieren"
match = Array.new
diff = Array.new
ergebnis = Hash.new

str1array = str_1.split(",")
str2array = str_2.split(",")

diff = (str1array - str2array) + (str2array - str1array)
match = str1array & str2array


ergebnis[:diff] = diff
ergebnis[:match] = match
puts ergebnis