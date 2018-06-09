require 'random_data'
require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: RandomData.random_sentence
  )

end

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
