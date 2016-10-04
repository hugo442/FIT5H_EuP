class Game
	def initialize(title)
		@title = title
		@players = []
		@health = []
	end

	def add_player(player, health)
		@players << player
		@health << health
	end
	def play
		puts "There are #{@players.size} players in #{@title}: \n" +
		@players.each do |player|
      		puts player
    	end
	end
end

spiel1 = Game.new("Knuckleheads")
spiel1.add_player("Moe", 100)
spiel1.add_player("Larry", 100)
spiel1.add_player("Curly", 100)