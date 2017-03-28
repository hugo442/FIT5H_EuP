namespace :import do
  desc "desc"
  task :csv => :environment do
  file_path = File.join("#{Rails.root}", "public", "Startnummern.csv")
  puts file_path

  File.open(file_path, 'r') do |file|
    file.each do |line|
      fields = line.split(";")
      if fields[0].blank? || fields[1].blank? || fields[2].blank?
        then
         #puts "so"
          next
          
      end
         
          nr = fields[0]
          strNr = fields[1]
          name = fields[2].split(" ")
          firstName = name[1]
          lastName = name[0]
          city = fields[3]

          #puts line
          #puts fields[0]
          #puts fields[1]
          #puts firstName
          #puts lastName
          #puts fields[3] 
          #puts "---------"

        Marksman.create(startnr: strNr, firstname: firstName, surname: lastName, location: city)
      
      end
    end
    puts "Fertig"
  end

end