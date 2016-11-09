class Bibiliothek

	attr_reader :name

	def initialize(name)
		@name = name
		@buecher = []
	end

	def add_book(buch)
		@buecher << buch
	end

	def to_s
		@buecher.each do |buch|
			puts "#{ausgabe(buch)}"
		end
	end

	def buch_aktion(jahr)
		mehr5 = 0
		mehr5text = ""
		mehr2 = 0
		mehr2text = ""
		weniger2 = 0
		weniger2text = ""
		@buecher.each do |buch|
			if jahr - buch.gekauft_am > 5
				mehr5 = mehr5 + 1
				mehr5text = mehr5text + "#{ausgabe(buch)}\n"
			elsif jahr - buch.gekauft_am > 2
				mehr2 = mehr2 + 1
				mehr2text = mehr2text + "#{ausgabe(buch)}\n"
			else
				weniger2 = weniger2 + 1
				weniger2text = weniger2text + "#{ausgabe(buch)}\n"
			end
		end
		
		
		if mehr5 > 1
			puts "#{weniger2} Bücher bei denen keine Aktion nötig ist:"
		else
			puts "#{weniger2} Buch bei dem keine Aktion nötig ist:"
		end
		puts weniger2text
		if mehr2 > 1
			puts "#{mehr2} Bücher bei denen eine Kontrolle nötig ist:"
		else
			puts "#{mehr2} Buch bei dem eine Kontrolle nötig ist:"
		end
		puts mehr2text
		if weniger2 > 1
			puts "#{mehr5} Bücher die in die Restaurierung gehen:"
		else
			puts "#{mehr5} Buch das in die Restaurierung geht:"
		end
		puts mehr5text

	end

	private
		def ausgabe(arraywert)
			var = ""
			arraywert.autor.each do |ausgabe| 
				var = "#{ausgabe.name}, "
			end
			var + "#{arraywert.titel}, #{arraywert.gekauft_am}"
		end

end

class Buch

	attr_accessor :titel, :gekauft_am, :autor

	def initialize(titel, datum, autor)
		@titel = titel
		@gekauft_am = datum
		@autor = []
		@autor << autor
	end


end

class Autor

	attr_reader :name, :geburtstag

	def initialize(name, geburtstag)
		@name = name
		@geburtstag = geburtstag
	end
end

class Ausleih
	attr_accessor :kunde
	def initialize(kunde, datum, buch)
		@kunde = kunde
		@ausgeliehenebuecher = Hash.new
		@ausgeliehenebuecher[buch.titel] = datum
	end

	def buch_holen(datum, buch)
		@ausgeliehenebuecher[buch.titel] = datum
	end

	def buch_zurueck(buch)
		@ausgeliehenebuecher.delete(buch.titel)
	end
	def ausgabe
		puts "Die Person #{@kunde} hat folgende Buecher ausgeliehen:"
		@ausgeliehenebuecher.each do |key, value|
			puts "Das Buch '#{key}' wurde von ihm am #{value} ausgeliehen.\n"
		end
	end
end


bibiliothek = Bibiliothek.new("Hamburg")
autor_1 = Autor.new("Maier", "20.3.1980")
buch_1 = Buch.new("Niemand", 2005, autor_1)
buch_2 = Buch.new("Jeder", 2010, autor_1)
buch_3 = Buch.new("Immer wieder gerne", 2013, autor_1)
buch_4 = Buch.new("Morgen ist auch noch ein Tag", 2011, autor_1)

allebuecher = [buch_1, buch_2, buch_3, buch_4]

allebuecher.each do |hinzu|
	bibiliothek.add_book(hinzu)
end

puts bibiliothek

bibiliothek.buch_aktion(2014)

kunde_1 = Ausleih.new("Peter", "08.11.2016", buch_1)
kunde_1.buch_holen("09.11.2016", buch_2)
kunde_1.buch_holen("09.11.2016", buch_3)
kunde_1.buch_zurueck(buch_2)

kunde_1.ausgabe