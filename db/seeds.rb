# db/seeds.rb

# Supprime les anciens services
Reservation.destroy_all
Service.destroy_all

# Crée des nouveaux services
services = [
  { name: "Chambres haut standing", description: "Des chambres élégantes et modernes, offrant tout le confort nécessaire, y compris un lit douillet, une douche moderne et un petit déjeuner continental inclus." },
  { name: "Studios meublés", description: "Des studios entièrement équipés avec cuisine moderne, salon à manger pour quatre, lit confortable et un petit déjeuner continental inclus." },
  { name: "Appartements meublés", description: "Des appartements spacieux avec deux chambres, une cuisine moderne, un séjour confortable et un petit déjeuner continental inclus." }
]

services.each do |service|
  Service.create!(service)
end

puts "Services créés avec succès !"
