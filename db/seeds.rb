puts 'Clean DB ...'

Car.destroy_all
User.destroy_all

puts 'Creating 3 users...'

first_user = User.create!(first_name: 'Josh', last_name: 'DENVER', email: 'toto@toto.fr', password: 'password', remote_photo_url: 'https://www.photocase.com/photos/56995-face-child-boy-child-laughter-hair-and-hairstyles-mouth-photocase-stock-photo-large.jpeg')
second_user = User.create!(first_name: 'Alison', last_name: 'KIVER', email: 'tata@tata.fr', password: 'password', remote_photo_url: 'https://www.mansmedijs.lu.lv/files/2017/09/222.jpg')
third_user = User.create!(first_name: 'Alan', last_name: 'PORTLAND',email: 'tutu@tutu.fr', password: 'password', remote_photo_url: 'https://ak7.picdn.net/shutterstock/videos/12666347/thumb/1.jpg')

# To add when the Cloudinary will be ready :
# remote_photo_url: 'https://unsplash.com/photos/khV4fTy6-D8'
# remote_photo_url: 'https://unsplash.com/photos/r1Pd018Hq9w'
# remote_photo_url: 'https://unsplash.com/photos/YfykaDg5sX4'

CARS_LIST = {
  "911 Carrera" => ["Porsche", 'Very nice car', second_user, 'gare', 'Nantes'],
  "911 Carrera Cabrio" => ["Porsche", 'Very nice car', second_user, 'gare', 'Biaritz'],
  "911 Targa" => ["Porsche", 'Very nice car', second_user, 'gare', 'Saint-Tropez'],
  "911 Turbo" => ["Porsche", 'Very nice car', second_user, 'gare', 'Metz'],
  "924" => ["Porsche", 'Very nice car', second_user, 'gare', 'Bordeau'],
  "944" => ["Porsche", 'Very nice car', second_user, 'gare', 'Nantes'],
  "997" => ["Porsche", 'Very nice car', second_user, 'gare', 'Rennes'],
  "Boxster" => ["Porsche", 'Very nice car', second_user, 'gare', 'Bethune'],
  "Cayenne" => ["Porsche", 'Very nice car', third_user, 'gare', 'Dunkerque'],
  "Cayman" => ["Porsche", 'Very nice car', third_user, 'gare', 'Caudry'],
  "Macan" => ["Porsche", 'Very nice car', third_user, 'gare', 'Faience'],
  "Panamera" => ["Porsche", 'Very nice car', third_user, 'gare', 'Faience'],
  "Subaru" => => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Florence'],
  "BRZ" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Cannes'],
  "Forester" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Marne la Vallée'],
  "Impreza" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Monaco'],
  "Impreza Wagon" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Caen'],
  "Justy" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Rouen'],
  "Legacy" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Reims'],
  "Legacy Wagon" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Metz'],
  "Legacy Outback" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Vannes'],
  "Levorg" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Le Crotoy'],
  "Outback" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Orléans'],
  "SVX" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Le Havre'],
  "Tribeca" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Grenoble'],
  "Tribeca B9" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Toulouse'],
  'DB11' => ['Aston Martin', 'pack iron man', first_user, 'Rue Marat', 'Bobigny'],,
  'Gallardo' => ['Lamborghini', 'pack wonder woman', third_user, '117 Boulevard de Valmy', 'Villeneuve-d\'Ascq'],,
  'f50' => ['Ferrari', 'pack biere', first_user, 'Rue de la Rotonde', 'Bethune'],,
  '812' => ['Ferrari', 'pack batman', second_user, '22 Avenue de l\'Europe', 'Leers'],,
  'RS' => ['Audi', 'pack spiderman', third_user, '30 Rue du Général Leclerc', 'Hem'],,
  'X90D' => ['Tesla', 'pack geek', second_user, 'Chemin des Rigons', 'Les Pennes-Mirabeau']
}

CARS = {
"Lexus" => ["CT", "GS", "GS 300", "GX", "IS", "IS 200", "IS 250 C", "IS-F", "LS", "LX", "NX", "RC F", "RX", "RX 300", "RX 400h", "RX 450h", "SC 430"],
"Audi" => ["100", "100 Avant", "80", "80 Avant", "80 Cabrio", "90", "A1", "A2", "A3", "A3 Cabriolet", "A3 Limuzina", "A3 Sportback", "A4", "A4 Allroad", "A4 Avant", "A4 Cabriolet", "A5", "A5 Cabriolet", "A5 Sportback", "A6", "A6 Allroad", "A6 Avant", "A7", "A8", "A8 Long", "Q3", "Q5", "Q7", "R8", "RS4 Cabriolet", "RS4/RS4 Avant", "RS5", "RS6 Avant", "RS7", "S3/S3 Sportback", "S4 Cabriolet", "S4/S4 Avant", "S5/S5 Cabriolet", "S6/RS6", "S7", "S8", "SQ5", "TT Coupé", "TT Roadster", "TTS"],
"Dodge" => ["Avenger", "Caliber", "Challenger", "Charger", "Grand Caravan", "Journey", "Magnum", "Nitro", "RAM", "Stealth", "Viper"],
"Hummer" => ["H2", "H3"],
"Infiniti" => ["EX", "FX", "G", "G Coupé", "M", "Q", "QX"],
"Jaguar" => ["Daimler", "F-Pace", "F-Type", "S-Type", "Sovereign", "X-Type", "X-type Estate", "XE", "XF", "XJ", "XJ12", "XJ6", "XJ8", "XJ8", "XJR", "XK", "XK8 Convertible", "XKR", "XKR Convertible"],
"Jeep" => ["Cherokee", "Commander", "Compass", "Grand Cherokee", "Patriot", "Renegade", "Wrangler"]}
}

IMG_URL = {
  "911 Carrera" => ["Porsche", 'Very nice car', second_user, 'gare', 'Nantes'],
  "911 Carrera Cabrio" => ["Porsche", 'Very nice car', second_user, 'gare', 'Biaritz'],
  "911 Targa" => ["Porsche", 'Very nice car', second_user, 'gare', 'Saint-Tropez'],
  "911 Turbo" => ["Porsche", 'Very nice car', second_user, 'gare', 'Metz'],
  "924" => ["Porsche", 'Very nice car', second_user, 'gare', 'Bordeau'],
  "944" => ["Porsche", 'Very nice car', second_user, 'gare', 'Nantes'],
  "997" => ["Porsche", 'Very nice car', second_user, 'gare', 'Rennes'],
  "Boxster" => ["Porsche", 'Very nice car', second_user, 'gare', 'Bethune'],
  "Cayenne" => ["Porsche", 'Very nice car', third_user, 'gare', 'Dunkerque'],
  "Cayman" => ["Porsche", 'Very nice car', third_user, 'gare', 'Caudry'],
  "Macan" => ["Porsche", 'Very nice car', third_user, 'gare', 'Faience'],
  "Panamera" => ["Porsche", 'Very nice car', third_user, 'gare', 'Faience'],
  "Subaru" => => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Florence'],
  "BRZ" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Cannes'],
  "Forester" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Marne la Vallée'],
  "Impreza" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Monaco'],
  "Impreza Wagon" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Caen'],
  "Justy" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Rouen'],
  "Legacy" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Reims'],
  "Legacy Wagon" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Metz'],
  "Legacy Outback" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Vannes'],
  "Levorg" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Le Crotoy'],
  "Outback" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Orléans'],
  "SVX" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Le Havre'],
  'Tribeca'
  'Tribeca B9'
  'DB11' => 'http://www.automobile-magazine.fr/asset/cms/964x603/93882/config/75345/aston-martin-naura-pas-trop-tarde-a-devoiler-la-version-volante-de-sa-db11.jpg',
  'Gallardo' => 'http://www.jet7prestiges.fr/photo/vehiculelo/72/lamborghini-gallardo.jpg',
  'f50' => 'https://cdn.motor1.com/images/mgl/4AGRk/s1/1995-ferrari-f50-en-vente-chez-rm-sothebys.jpg',
  '812' => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ36NJ3XLgeBwF2NvbHLygPgh6i7gdnctFYZId8tsU-8f_iOM9GCg',
  'RS' => 'https://www.viinz.com/wp-content/uploads/2017/11/essai-audi-tt-rs-coupe-2017-exterieur-84-2000x1333.jpg',
  'X90D' => 'https://www.hertzpageo.com/img/new_dream_collection/Switerland/Big/Tesla-X---aussen-2-big.jpg'
}

puts 'Creating 5 cars...'

CARS_LIST.each do |car, value|
  Car.create!(
    model: car,
    remote_photo_url: IMG_URL[car],
    brand: value[0],
    description: value[1],
    price: value[2],
    user: value[3],
    address: value[4],
    city: value[5]
  )
end

# puts 'Creating 3 cars...'

# car = Car.create!(
#     model: 'DB11',
#     remote_photo_url: 'https://res.cloudinary.com/samirz/image/upload/v1534953970/ejuhzjyztwzxbnzgp9mo.jpg',
#     brand: 'Aston Martin',
#     description: 'pack iron man',
#     price: 540,
#     user: first_user,
#     address: '12 rue du general Leclerc',
#     city: 'Paris'
#     )

# car = Car.create!(
#     model: 'Gallardo',
#     remote_photo_url: 'https://res.cloudinary.com/samirz/image/upload/v1534953970/ejuhzjyztwzxbnzgp9mo.jpg',
#     brand: 'Lamborghini',
#     description: 'pack wonder woman',
#     price: 450,
#     user: third_use,
#     address: '12 rue du general Leclerc',
#     city: 'Lille'
#     )

# car = Car.create!(
#     model: 'f50',
#     remote_photo_url: 'https://res.cloudinary.com/samirz/image/upload/v1534953970/ejuhzjyztwzxbnzgp9mo.jpg',
#     brand: 'Ferrari',
#     description: 'pack de biere',
#     price: 410,
#     user: first_user,
#     address: '12 rue du general Leclerc',
#     city: 'Bethune'
#     )
