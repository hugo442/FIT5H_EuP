class Customer
	attr_accessor :firstname
	attr_accessor :lastname
	attr_accessor :street
	attr_accessor :city

	def initialize(bank_account, lastname="")
		@bank_account = bank_account
		@lastname = lastname
	end

	def print_address
		"Konto:".ljust(15,".") + "#{@bank_account} \n" +
		"Name:".ljust(15,".") + "#{@firstname} #{@lastname} \n" +
		"Strasse:".ljust(15,".") + "#{@street} \n" +
		"Ort:".ljust(15,".") + "#{city}"
	end
end

obj=Customer.new("9999", "Lodgz")
obj.firstname = "Theo"
obj.street = "Hermelinweg 7"
obj.city = "22159 Hamburg"
puts obj.print_address