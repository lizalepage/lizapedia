require 'random_data'

5.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )

end

users = User.all

50.times do

  wiki = Wiki.create!(
    user: users.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
