require 'faker'

FactoryBot.define do
  factory :project do
    title { Faker::App.name }
    description { Faker::Lorem.paragraph }
    value_to_get { Faker::Number.decimal(2) }
  end

  factory :project_item do
    value_to_pass { Faker::Number.decimal(2) }
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end
end