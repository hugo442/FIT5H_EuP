class Player
	def initialize(name, health = 100)
		@name = name
		@health = health
	end
	def to_s
		"Ich bin #{@name} mit #{@health} HP. #{@spruch}"
	end
	#to_s methode wird überschrieben. Da sie automatisch 
	#aufgerufen wird wenn man nur das Objekt ausgibt.
	def blam(value=0)
		@health -= value
		#@health = @health - value
		@spruch = "#{@name} got blamed"
	end
	def w00t(value=0)
		@health += value
		#@health = @health + value
		@spruch = "#{@name} got w00ted"
	end
end

player1 = Player.new("Phil", 100)
puts player1
player1.blam(25)
puts player1

player2 = Player.new("Valid")
puts player2
player2.w00t(30)
puts player2