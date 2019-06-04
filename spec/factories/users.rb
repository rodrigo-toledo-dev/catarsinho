require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'asdqwe123' }
    password_confirmation { 'asdqwe123' }
  end
end
