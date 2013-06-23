# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['db:reset'].invoke

lorem = Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

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
                     description: lorem,
                     due: "2013-08-22")
project2 = user.projects.create(title: "ConnectOne Security",
                     description: lorem,
                     due: "2013-09-18")

# I don't know why it's making me make it this way.
project3 = Project.create(title: "CSW Creations Website",
                                description: lorem,
                                due: "2013-07-29",
                                user_id: 2)

# Make first user a member of user2's project
project1.members << user2

# Make Discussions
project1.discussions.create!(title: "Design Stages...",
                           message: "Starting Design Today...",
                           user_id: 1)
project1.discussions.create!(title: "Started Dev Stages Today",
                           message: "Starting Development Today...",
                           user_id: 2)

project2.discussions.create!(title: "Pre-Planning Stages...",
                           message: "Starting planning Today...",
                           user_id: 3)
project2.discussions.create!(title: "Starting Dev Stages Today",
                           message: "Starting Development Today...",
                           user_id: 2)

project3.discussions.create!(title: "Sending Proposal",
                           message: "Starting Development Today...",
                           user_id: 4)


