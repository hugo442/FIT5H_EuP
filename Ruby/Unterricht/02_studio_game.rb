name1 = "larry"
name2 = "curly"
name3 = "moe"
health = 60

puts "#{name1} health is #{health}"
puts "#{name1} health is #{health * 3}"
puts "#{name1} health is #{health / 9.0}"	#Wenn 9.0 benutzt, dann wird es zu einer float Variablen
puts "#{name1} health is #{health.to_f / 9}"

puts "Players:\n\t#{name1}\n\t#{name2}\n\t#{name3}"

allenamen = <<HEREDOC
Players:
	#{name1}
	#{name2}
	#{name3}
HEREDOC
puts allenamen