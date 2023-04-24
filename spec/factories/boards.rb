FactoryBot.define do
  factory :board do
    name { Faker::Name.name }
    height { Faker::Number.digit }
    width { Faker::Number.digit }
    no_of_mines { Faker::Number.digit }
    email { Faker::Internet.email }
  end
end
