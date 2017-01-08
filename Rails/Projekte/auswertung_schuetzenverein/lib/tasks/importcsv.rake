namespace :import do
  desc "desc"
  task :csv => :environment do
  file_path = File.join("#{Rails.root}", "public", "Startnummern1.csv")
  puts file_path

  File.open(file_path, 'r') do |file|
    file.each do |line|
      fields = line.split(";")
      if fields[0].blank? || fields[1].blank? || fields[2].blank?
        then
         #puts "huso"
          next
          
      end
         
          nr = fields[0]
          strNr = fields[1]
          name = fields[2].split(" ")
          firstName = name[0]
          lastName = name[1]
          city = fields[3]

          #puts line
          #puts fields[0]
          #puts fields[1]
          #puts firstName
          #puts lastName
          #puts fields[3] 
          #puts "---------"

        Schuetze.create(startnummer: strNr, vorname: firstName, name: lastName, ort: city)
      
      end
    end
    puts "Fertig"
  end

end