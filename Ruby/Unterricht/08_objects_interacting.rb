class Game
	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		@players << player
	end
	def play
		puts "There are #{@players.size} players in #{@title}: \n"
		@players.each do |player|
		  puts player
		end

		@players.each do |player|
		  player.blam
		  player.w00t
		  player.w00t
		  puts player
		end
	end
end

class Player

  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end
  
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
  
  def score
    @health + @name.length
  end
  
end


player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

allespieler = [player1, player2, player3]

spiel1 = Game.new("Knuckleheads")

allespieler.each do |spieler|
	spiel1.add_player(spieler)
end

spiel1.play