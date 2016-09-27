def say_hello1(parameter1=100)
	"Ich bin Ludwig mit einem Wert von #{parameter1} um #{set_time}"
	
end

def set_time
	Time.new.strftime("%H:%M")
	
end


puts say_hello1