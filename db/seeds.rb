Answer.destroy_all

Question.destroy_all
OptionChoice.destroy_all
OptionGroup.destroy_all
Section.destroy_all
UserHousing.destroy_all
Booking.destroy_all
Housing.destroy_all
User.destroy_all
Diagnostic.destroy_all



puts "All tables are destroyed !"

puts "Generating random users"

#Users / Client
diagnostician = User.create!(email: "jo@yahoo.fr", password: "123456", first_name: "Jo", last_name: "Sera", phone:"06 11 22 33 44", role:1)
jules = User.create!(email: "jules@yahoo.fr", password: "123456", first_name: "Jules", last_name: "Marchello", phone:"06 11 22 33 44", role:0)
max = User.create!(email: "max@yahoo.fr", password: "123456", first_name: "Max", last_name: "Boue", phone:"06 11 22 33 44", role:0)
sami = User.create!(email: "sam@yahoo.fr", password: "123456", first_name: "Sam", last_name: "Chalalala", phone:"06 11 22 33 44", role:0)

#Housings
Housing.create!(address:"Diagnostician house", created_at:"01-01-2017", updated_at:"01-01-2017")
UserHousing.create!(user: diagnostician, housing: Housing.last, user_state: 1 )

housing1 = Housing.create!(address:"Auchan Drive Bouliac", created_at:"01-01-2017", updated_at:"01-01-2017")
UserHousing.create!(user: jules, housing: Housing.last, user_state: 1 )

housing2 = Housing.create!(address:" 2 rue de l'église Bouliac", created_at:"01-01-2017", updated_at:"02-02-2017")
UserHousing.create!(user: jules, housing: Housing.last, user_state: 1 )

housing3 = Housing.create!(address:" 6 Chemin de Créon 33270 BOULIAC", created_at:"01-01-2017", updated_at:"03-01-2017")
UserHousing.create!(user: max, housing: Housing.last, user_state: 1 )

housing4 = Housing.create!(address:"gestion de l’eau 24 route de Latresne Bouliac", created_at:"01-01-2017", updated_at:"04-01-2017")
UserHousing.create!(user: sami, housing: Housing.last, user_state: 1 )

puts "Housing créé: #{Housing.count}"
puts "UserHousing créé: #{UserHousing.count}"

housings = [housing1, housing2, housing3, housing4]

#Bookings
housings.each do |housing|
  Diagnostic.create!
  Booking.create!(user_id: diagnostician.id, housing: housing, diagnostic: Diagnostic.last, set_at:"#{rand(1..25)}-#{rand(9..12)}-2017-08:00:00 +0000", comment:"Book seed #{Booking.count}", confirmed_at: nil)
end

puts "Booking créé: #{Booking.count}"


sections = ["inhabitant", "risk_awarness", "works_against_inondation", "place", "history",
"accessibility", "history_references", "housing", "structure", "shelter", "furniture", "exit", "airflow", "sanitation", "electricity", "warming"]
sections.each do |section|
  Section.create(name: section)
end
puts "Création des #{Section.count} sections"

units = ["cm", "m", "m^2", "km", "€", "jours", "années"]
units.each do |unit|
  Unit.create(name: unit)
end
puts "Création des #{Unit.all.size} unités de mesure"


option_groups = ["groupe 0", "groupe 1", "groupe 2", "groupe 3", "groupe 4", "groupe 5", "groupe 6"]
option_groups.each do |option|
  OptionGroup.create(name: option)
end
puts "Création des #{OptionGroup.count} option groups"

option_choices = {
  "groupe 0" => [],
  "groupe 1" => ["Vrai", "Faux", "NSP"],
  "groupe 2" => ["Oui", "Non", "Sans avis"],
  "groupe 3" => ["1", "2", "3", "4", "plus"],
  "groupe 4" => [1900..2017],
  "groupe 5" => [1..100000],
  "groupe 6" => ["", "nil"]
}

option_choices.each { |key, value|
  value.each {|choix|
    OptionChoice.create(option_group: OptionGroup.find_by(name: key), name: choix)
  }
}

# RAPPEL enum input_type: {option_choice_id: 0, numeric: 1, string: 2, boolean: 3}

puts "Création des #{OptionChoice.count} option choices"

question1 = Question.create!( section: Section.find_by(name: "inhabitant"), name: "Nom de l’occupant principal?", option_group: OptionGroup.find_by(name: "groupe 0"), information: "nom_habitant", input_type: 2)
question2 = Question.create!( section: Section.find_by(name: "inhabitant"), name: "Nombre d'occupants?", information: "nombre_occupants", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 0)
question3 = Question.create!( section: Section.find_by(name: "inhabitant"), name: "Nombre de mineurs?", information: "nombre_mineurs", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 0)
question4 = Question.create!( section: Section.find_by(name: "inhabitant"), name: "Nombre de personnes âgées?", information: "nombre_seniors", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 0)
question5 = Question.create!( section: Section.find_by(name: "inhabitant"), name: "Nombre de personnes à mobilité réduite?", information: "nombre_pmr", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 1)
question6 = Question.create!( section: Section.find_by(name: "inhabitant"), name: "Nombre de personnes dépendantes autres?", information: "nombre_dependants", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 0)
question7 = Question.create!( section: Section.find_by(name: "inhabitant"), name: "Année d'entrée dans le logement?", information: "duree_habitation", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 0)
question8 = Question.create!( section: Section.find_by(name: "place"), name: "Superficie du terrain?", information: "superficie_terrain", option_group: OptionGroup.find_by(name: "groupe 0"), unit_id: 2, input_type: 1)
question9 = Question.create!( section: Section.find_by(name: "place"), name: "Nombre de logements?", information: "nombre_logements", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question10 = Question.create!( section: Section.find_by(name: "place"), name: "Surface habitable?", information: "surface_habitable", option_group: OptionGroup.find_by(name: "groupe 0"), unit_id: 2, input_type: 1)
question11 = Question.create!( section: Section.find_by(name: "place"), name: "Année de construction?", information: "annee_construction", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 1)
question12 = Question.create!( section: Section.find_by(name: "place"), name: "Avez-vous été informé d'un potentiel risque d'inondation de votre habitation à l'achat ou à la location ?", information: "conscience_risque", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question13 = Question.create!( section: Section.find_by(name: "risk_awarness"), name: "Avez-vous été informé des risques d'inondation sur la ville de Nîmes ?", information: "informe_zone", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question14 = Question.create!( section: Section.find_by(name: "risk_awarness"), name: "Votre habitation est-elle concernée par les risques d'inondation ?", information: "informe_habitation", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question15 = Question.create!( section: Section.find_by(name: "risk_awarness"), name: "Le risque d'inondation vous semble-t-il préoccupant ?", information: "risque_preoccupant", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question16 = Question.create!( section: Section.find_by(name: "risk_awarness"), name: "Avez-vous connaissance d'un Plan Communal de Sauvegarde ?", information: "informe_pcs", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question17 = Question.create!( section: Section.find_by(name: "risk_awarness"), name: "Savez-vous ce qu'est un PPRI?", information: "informe_ppri", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question18 = Question.create!( section: Section.find_by(name: "shelter"), name: "Présence d'un espace refuge conforme au PPRi? ", information: "refuge_ppri", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question19 = Question.create!( section: Section.find_by(name: "shelter"), name: "Superficie de l'espace", information: "superficie_espace", option_group: OptionGroup.find_by(name: "groupe 0"), unit_id: 2, input_type: 1)
question20 = Question.create!( section: Section.find_by(name: "shelter"), name: "Possibilité d'évacuation ?", information: "evacuation", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)

puts "Questions créé: #{Question.count}"
