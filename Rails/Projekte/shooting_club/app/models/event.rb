class Event < ApplicationRecord

	def self.import(resume)
		ec = Encoding::Converter.new("ISO-8859-1", "UTF-8")
		file_path = "#{Rails.root}/public#{resume.attachment}"
		@post = []
		File.open(file_path, 'r') do |file|
			file.each do |rows|
				rows = ec.convert(rows)
				rows = rows.tr(",", ".")
				row = rows.split(" ; ")
				#@post << row
				if row
				#unless Event.exists?(date: row[16], time: row[14], marksmen: row[4])
				#	Event.create(name: row[0], unknown0: row[1], unknown1: row[2], shooting_range: row[3], marksmen: row[4], unknown2: row[5], unknown3: row[6], shoot_number: row[7], value: row[8], unknown4: row[9], unknown5: row[10], unknown6: row[11], unknown7: row[12], unknown8: row[13], time: row[14], unknown9: row[15], date: row[16], unknown10: row[17], unknown11: row[18])
				#end



			end
		end
		@post
	end
end
