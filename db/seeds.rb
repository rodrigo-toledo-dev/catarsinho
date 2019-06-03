Project.destroy_all
User.destroy_all
users = [
  {email: 'rodrigo@rtoledo.inf.br', password: 'asdqwe123', password_confirmation: 'asdqwe123'},
  {email: 'rreginato@conviso.com.br', password: 'asdqwe123', password_confirmation: 'asdqwe123'},
]
User.create!(users)

require 'faker'
require 'json'
images_file = JSON.parse(File.read(Rails.root.join('db','initial_assets','images.json')))
User.all.each do |user|
  12.times.each do
    project = user.projects.build(title: Faker::App.name, description: Faker::Lorem.paragraph, value_to_get: Faker::Number.between(200, 500))
    project.save!
    # image = images_file.sample
    # project.image.attach(io: File.open(Rails.root.join('db','initial_assets', image['image'])), filename: image['image'])
  end
end
