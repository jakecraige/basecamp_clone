# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['db:reset'].invoke

# Create Users
user = User.create!(name: "Jake Craige",
             email: "jake@poeticsystems.com",
             password: "foobar",
             password_confirmation: "foobar")
user2 = User.create!(name: "Neal Naumann",
             email: "james.craige@gmail.com",
             password: "foobar",
             password_confirmation: "foobar")

30.times do |n|
  name = Faker::Name.name
  email = "example#{n+1}@gmail.com"
  password = "foobar"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

# Create Projects
project1 = user.projects.create(title: "McDaniels",
                     description: "Create everything for this company.",
                     due: "2013-08-22")
project2 = user.projects.create(title: "ConnectOne Security",
                     description: "Make a website that has blah blah on it",
                     due: "2013-09-18")

project3 = user2.projects.create(title: "CSW Creations Website",
                                description: "This is my description",
                                due: "2013-07-29")

# Make first user a member of user2's project
project1.members << user

# Make Discussions
project1.discussions.create!(title: "Design Stages...",
                           message: "Starting Design Today...",
                           user_id: 1)
project1.discussions.create!(title: "Started Dev Stages Today",
                           message: "Starting Development Today...",
                           user_id: 2)



