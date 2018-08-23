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

CARS = {
  'DB11' => ['Aston Martin', 'pack iron man',540, first_user, 'Rue Marat', 'Bobigny'],
  'Gallardo' => ['Lamborghini', 'pack wonder woman',450, third_user, '117 Boulevard de Valmy', 'Villeneuve-d\'Ascq'],
  'f50' => ['Ferrari', 'pack biere', 410, first_user, 'Rue de la Rotonde', 'Bethune'],
  '812' => ['Ferrari', 'pack batman', 430, second_user, '22 Avenue de l\'Europe', 'Leers'],
  'RS' => ['Audi', 'pack spiderman', 480, third_user, '30 Rue du Général Leclerc', 'Hem'],
  'X90D' => ['Tesla', 'pack geek', 630, second_user, 'Chemin des Rigons', 'Les Pennes-Mirabeau']
}

IMG_URL = {
  'DB11' => 'http://www.automobile-magazine.fr/asset/cms/964x603/93882/config/75345/aston-martin-naura-pas-trop-tarde-a-devoiler-la-version-volante-de-sa-db11.jpg',
  'Gallardo' => 'http://www.jet7prestiges.fr/photo/vehiculelo/72/lamborghini-gallardo.jpg',
  'f50' => 'https://photos1.tf1.fr/660/370/ferrari-f50-angleterre-4e359a-0@1x.jpg',
  '812' => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ36NJ3XLgeBwF2NvbHLygPgh6i7gdnctFYZId8tsU-8f_iOM9GCg',
  'RS' => 'https://www.viinz.com/wp-content/uploads/2017/11/essai-audi-tt-rs-coupe-2017-exterieur-84-2000x1333.jpg',
  'X90D' => 'https://www.hertzpageo.com/img/new_dream_collection/Switerland/Big/Tesla-X---aussen-2-big.jpg'
}

puts 'Creating 5 cars...'

CARS.each do |car, value|
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
