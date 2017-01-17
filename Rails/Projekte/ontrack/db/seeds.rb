# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.create(title: "Pruefungsvorbereitung EuP", description: "Alles was fuer EuP zu lernen ist", start_date: "2017-04-01")
Project.create(title: "Facharbeit", description: "Planen, Durchfuehren, Beschreiben eines themas", start_date: "2017-02-01")
Iteration.create(title: "Literatur sichten", description: "Alle ueber das Thema zusammensuchen", start_date: "2017-02-01", end_date: "2017-02-10", project_id: "1")