FactoryGirl.define do
  factory :user do
    name                  "Jake Craige"
    email                 "jake.craige@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end
