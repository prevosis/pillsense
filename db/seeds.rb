# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create!(name:  'Aadil Bhatti',
             email: 'aadilzbhatti@gmail.com',
             password:              'prevosis',
             password_confirmation: 'prevosis',
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = 'password'
  Provider.create!(name:  name,
                   email: email,
                   password:              password,
                   password_confirmation: password)
end