require_relative "bibliothek"
require_relative "autor"
require_relative "buch"

bibliothek = Bibliothek.new("Hamburg")

autor_1 = Autor.new("Maier", "20.03.1980")

buch_1 = Buch.new(autor_1, "Niemand", 2005)
buch_2 = Buch.new(autor_1, "Jeder", 2010)
buch_3 = Buch.new(autor_1, "Immer wieder gerne", 2013)
buch_4 = Buch.new(autor_1, "Morgen ist auch noch ein Tag", 2011)

bibliothek.add_buch(buch_1)
bibliothek.add_buch(buch_2)
bibliothek.add_buch(buch_3)
bibliothek.add_buch(buch_4)