FactoryBot.define do
  factory :project_item do
    value_to_pass { Faker::Number.decimal(2) }
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end
end
