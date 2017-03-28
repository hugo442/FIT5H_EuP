class Autor
	attr_reader :name
	attr_reader :geburtstag
	
	def initialize(name, geburtstag)
		@name = name
		@geburtstag = geburtstag
	end
end