
10.times do
  App.create!(
  name: Faker::App.name,
  URL:  Faker::Internet.url
  )
end
apps = App.all

25.times do
  Event.create!(
  app: apps.sample,
  name: Faker::Hipster.word
  )
end

puts "Seed finished"
puts "#{App.count} apps created"
puts "#{Event.count} events created"
