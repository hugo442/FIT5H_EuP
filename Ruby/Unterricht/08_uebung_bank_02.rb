class Kunde
	attr_accessor :name, :gehalt
	attr_writer :adresse

	def initialize(name)
		@name = name
	end

	def ausgabe
		puts "#{@name}, #{@adresse}"
	end
end

class Kredit
	attr_accessor :kredit
	def initialize(kunde)
		@kunde = kunde
	end

	def ausgabe
		puts "#{@kunde.ausgabe}.Jahresgehalt: #{@kunde.gehalt * 12} Euro."
	end
end

kunde1 = Kunde.new("Theo Sommer")
kunde1.name = "Theo Sonnenschein"
kunde1.gehalt = 2000
kunde1.adresse = "Hermelinweg 11, 22159 Hamburg"

puts kunde1.ausgabe

kredit1 = Kredit.new(kunde1)
kredit1.kredit = 5000
kredit1.ausgabe
