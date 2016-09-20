name1 = "Larry"
name2 = "Curly"
name3 = "Moe"
name4 = "Shemp"
health1 = 60
health2 = 125
health3 = 100
health4 = 90

puts "#{name1} has a health of #{health1}"
puts "#{name2.upcase} has a health of #{health2}"

2.times do
	puts "#{name3} has a health of #{health3}.".center(50,'*')
end

2.times do
	puts name4.ljust(30,'.') + " #{health4} health"
end

allenamen = <<HEREDOC
Players:
	#{name1}
	#{name2}
	#{name3}
HEREDOC
puts allenamen

t = Time.new
puts "The game started on #{t.strftime('%A %d/%m/%G at %R%P')}"