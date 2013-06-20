FactoryGirl.define do
  factory :user do
    name                  "Jake Craige"
    email                 "jake.craige@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
  end
  factory :project do
    title          "Testing Title"
    description    "This is my description"
  end
end
