puts 'Clean DB ...'

Car.destroy_all
User.destroy_all

puts 'Creating 3 users...'

first_user = User.create!(first_name: 'Josh', last_name: 'DENVER', email: 'toto@toto.fr', password: 'password')
second_user = User.create!(first_name: 'Alison', last_name: 'KIVER', email: 'tata@tata.fr', password: 'password')
third_user = User.create!(first_name: 'Alan', last_name: 'PORTLAND',email: 'tutu@tutu.fr', password: 'password')

# To add when the Cloudinary will be ready :
# remote_photo_url: 'https://unsplash.com/photos/khV4fTy6-D8'
# remote_photo_url: 'https://unsplash.com/photos/r1Pd018Hq9w'
# remote_photo_url: 'https://unsplash.com/photos/YfykaDg5sX4'

CARS = {
  'DB11' => ['Aston Martin', 'pack iron man',540, first_user, 'Rue Marat', 'Bobigny'],
  'Gallardo' => ['Lamborghini', 'pack wonder woman',450, third_user, '117 Boulevard de Valmy', 'Villeneuve-d\'Ascq'],
  'f50' => ['Ferrari', 'pack biere', 410, first_user, 'Rue de la Rotonde', 'Bethune'],
  '812' => ['Ferrari', 'pack batman', 430, second_user, '22 Avenue de l\'Europe', 'Leers'],
  'RS' => ['Audi', 'pack spiderman', 480, third_user, '30 Rue du Général Leclerc', 'Hem']
}

IMG_URL = {
  'DB11' => 'https://res.cloudinary.com/samirz/image/upload/v1534952659/ko84oe0hx4skm5wpdskb.jpg',
  'Gallardo' => 'https://res.cloudinary.com/samirz/image/upload/v1534953970/ejuhzjyztwzxbnzgp9mo.jpg',
  'f50' => 'https://res.cloudinary.com/samirz/image/upload/v1534954023/zxkzteznztfm5tq1vvjx.jpg',
  '812' => 'https://res.cloudinary.com/samirz/image/upload/v1534954105/lmzcotuqrh36hxxgkkpz.jpg',
  'RS' => 'https://res.cloudinary.com/samirz/image/upload/v1534954505/zpl2scybhvogt0wkjfyj.jpg'
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
