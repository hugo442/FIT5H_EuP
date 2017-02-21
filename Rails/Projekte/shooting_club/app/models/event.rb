class Event < ApplicationRecord

	def self.import(resume)
		resume.each do |file|
			rows = file.split(";")
			unless Event.exists?(date: rows[16], time: rows[14], marksmen: rows[4])
				Event.create
			end



		end
	end
end
