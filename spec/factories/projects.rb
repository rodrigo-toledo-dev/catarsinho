require 'faker'
FactoryBot.define do
  factory :project do
    user
    title { Faker::App.name }
    description { Faker::Lorem.paragraph }
    value_to_get { Faker::Number.decimal(2) }
  end
end
