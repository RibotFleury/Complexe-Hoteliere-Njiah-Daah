# db/seeds.rb

# Supprime les anciens services
Service.destroy_all

# Crée des nouveaux services
services = [
  { name: "chambre simple", description: "Une chambre simple avec lit confortable, TV et connexion Wi-Fi." },
  { name: "chambre climatisée", description: "Une chambre avec climatisation, lit confortable, TV et connexion Wi-Fi." },
  { name: "appartement meublé", description: "Un appartement entièrement meublé avec cuisine équipée, séjour, et chambre séparée." }
]

services.each do |service|
  Service.create!(service)
end

puts "Services créés avec succès !"
