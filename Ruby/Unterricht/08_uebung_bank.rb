class Kredit
	def initialize(kunde)
		@kunde = kunde
	end

	def kunde
		"#{@kunde.adresse}. Jahresgehalt: #{@kunde.gehalt * 12}"
	end
end

class Kunde 
attr_accessor :name, :gehalt
attr_writer :adresse

def initialize(name)
	@name = name
end

def adresse 
	"#{@name}, #{@adresse}"
end

end

kunde1 = Kunde.new("Theo Sommer")
kunde1.name = "Theo Sonnenschein"
puts kunde1.name
kunde1.gehalt = 2000
kunde1.adresse = "Hermelingweg 11, 22159 Hamburg"
puts kunde1.adresse

kredit1 = Kredit.new(kunde1)
puts kredit1.kunde