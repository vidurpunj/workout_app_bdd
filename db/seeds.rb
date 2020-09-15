# Creating users
# run only schema.rb file rails db:schema:load
# run only seeds.rb file rails db:seed
p 'Creating 500 users'
500.times do
  user = User.create({
                         first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
                         email: Faker::Internet.email,
                         password: [*('a'..'z'), *('A'..'Z'), *(0..9)]
                     })
  p User.count
end
p 'Done'