require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Coffee.blend_name
  )

end

User.create!(email: 'lizalepage@gmail.com', password: 'bubbles16')

users = User.all

50.times do

  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::NewGirl.quote,
    body: Faker::MostInterestingManInTheWorld.quote 
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
