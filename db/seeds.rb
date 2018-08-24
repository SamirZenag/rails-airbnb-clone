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
  "BRZ" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Cannes'],
  "Forester" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Marne la Vallée'],
  "Impreza" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Monaco'],
  "Impreza Wagon" => ['Subaru', 'Nice asian car', third_user, 'hopital', 'Caen'],
  "Justy" => ['Subaru', 'Nice asian car', first_user, 'hopital', 'Rouen'],
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
  '911 Carrera' => 'https://upload.wikimedia.org/wikipedia/commons/0/0f/2002_911C4S.JPG',
  '911 Carrera Cabrio' => 'https://www.netcarshow.com/Porsche-911_Carrera_Cabriolet-2013-wallpaper.jpg',
  '911 Targa' => 'https://4cd598e3f6d533189ea3-47577a5222eca74d8797f62840b060bf.ssl.cf1.rackcdn.com/WP0BB2A94JS134771/6dffdc29795a3c88748e4b9cff8043a6.jpg',
  '911 Turbo' => 'http://t911.wpengine.com/wp-content/uploads/2015/10/996-Turbo-S-driving.jpg',
  '924' => 'http://porscheclub-924-944-968.fr/hosting924944968/41198420170907191112.jpg',
  '944' => 'https://cdn.bringatrailer.com/wp-content/uploads/2017/10/59e130481dd46_140251-940x700.jpg',
  '997' => 'https://www.porscheclubgb.com/getmedia/6c2c920d-4893-4af0-845a-6799a05188c7/Porsche_997_Buyers_Guide_633.jpg',
  'Boxster' => 'https://galeri13.uludagsozluk.com/631/ataturk-un-en-sevdigi-araba_1234780.jpg',
  'Cayenne' => 'https://res.cloudinary.com/jpress/image/fetch/c_fill,f_auto,h_596,q_auto:eco,w_900/https://inews.co.uk/wp-content/uploads/2017/11/porsche-cayenne-s-4-star-car.jpg',
  'Cayman' => 'https://s.auto.drom.ru/img4/catalog/photos/fullsize/porsche/cayman/porsche_cayman_35752.jpg',
  'Macan' => 'http://www.executivestyle.com.au/content/dam/images/3/9/t/i/6/image.related.articleLeadwide.620x349.39u2n.png/1428455972091.jpg',
  'Panamera' => 'http://sf1.viepratique.fr/wp-content/uploads/sites/9/2016/11/okpanameraexecutive3-750x410.jpg',
  'BRZ' => 'https://i.kinja-img.com/gawker-media/image/upload/s--E8-oS6xw--/c_scale,f_auto,fl_progressive,q_80,w_800/sxp1igg5t5i652jit0d4.jpg',
  'Forester' => 'http://newcarsportal.com/wp-content/uploads/2018/07/2019-Subaru-Forester-2.jpg',
  'Impreza' => "https://img03.carview.co.jp/trade/img06/cars/2455216/21515124/japan%20car/2007+subaru+impreza+wrx+sti/01w.jpg",
  'Impreza Wagon' => 'http://4-photos7.motorcar.com/used-2013-subaru-impreza_wagon_wrx-certifiedwrxpremiumwagon5spdnavigation-1186-13496773-1-1024.jpg',
  'Justy' => 'http://2.bp.blogspot.com/__9TTj0s27Vk/SaM2fBbswpI/AAAAAAAAA1o/FFZrFpxFEU4/s400/Subaru+Justy.jpg',
  'DB11' => 'http://www.automobile-magazine.fr/asset/cms/964x603/93882/config/75345/aston-martin-naura-pas-trop-tarde-a-devoiler-la-version-volante-de-sa-db11.jpg',
  'Gallardo' => 'http://www.jet7prestiges.fr/photo/vehiculelo/72/lamborghini-gallardo.jpg',
  'f50' => 'https://cdn.motor1.com/images/mgl/4AGRk/s1/1995-ferrari-f50-en-vente-chez-rm-sothebys.jpg',
  '812' => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ36NJ3XLgeBwF2NvbHLygPgh6i7gdnctFYZId8tsU-8f_iOM9GCg',
  'RS' => 'https://www.viinz.com/wp-content/uploads/2017/11/essai-audi-tt-rs-coupe-2017-exterieur-84-2000x1333.jpg',
  'X90D' => 'https://www.hertzpageo.com/img/new_dream_collection/Switerland/Big/Tesla-X---aussen-2-big.jpg'
}

puts 'Creating 23 cars...'

CARS_LIST.each do |car, value|
  Car.create!(
    model: car,
    remote_photo_url: IMG_URL[car],
    brand: value[0],
    description: value[1],
    price: (350..450).sample,
    user: value[3],
    address: value[4],
    city: value[5]
  )
end
