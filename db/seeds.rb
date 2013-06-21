# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['db:reset'].invoke
user = User.create!(name: "Jake Craige",
             email: "jake@poeticsystems.com",
             password: "foobar",
             password_confirmation: "foobar")
99.times do |n|
  name = Faker::Name.name
  email = "example#{n+1}@gmail.com"
  password = "foobar"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

user.projects.create(title: "Test Project", description: "This is my description")
user.projects.create(title: "Test Project 2", description: "This is my second description")

user2 = User.find(2)
project = user2.projects.create(title: "Test Project User 2 owns", description: "This is my description")

project.members << user



