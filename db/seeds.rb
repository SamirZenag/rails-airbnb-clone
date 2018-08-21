require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
brand_list = ['Renault', 'Peugeot', 'BMX', 'Mercedes']

puts 'Creating 10 cars...'

def construct_car
  10.times do |variable|
    Car.create!(brand: 'Renault',
            model:'4L',
            description:'Very nice car',
            price: [100, 150, 200].sample ,
            user: '<User id: 1, email: "ajonvill@yahoo.fr", created_at: "2018-08-21 10:53:40", updated_at: "2018-08-21 12:40:48">',
            lat: Faker::Address.latitude.to_i,
            lng: Faker::Address.longitude.to_i,
            address: Faker::Address.street_address,
            city: Faker::Address.city,
            postal_code: Faker::Address.zip_code,
            country: Faker::Address.country)
  end
end

construct_car
