class Calculator
	def initialize(x, y)
		@x = x
		@y = y
	end

	def add
		"#{@x + @y}"
	end

	def subtract
		"#{@x - @y}"
	end
end

obj=Calculator.new(10, 7)
puts obj.add
puts obj.subtract