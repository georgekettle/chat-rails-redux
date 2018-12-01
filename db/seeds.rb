# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.delete_all
User.delete_all
Channel.delete_all

puts `#{Message.all}`

puts 'Creating channels'
channels = ['barcelona', 'react', 'general']
channels.each { |channel| Channel.create(name: channel) }
puts 'channels count is'
puts channels.count

puts 'Creating users'
users = [
  {email: 'george@example.com', password: '1234567'},
  {email: 'alice@example.com', password: '1234567'},
  {email: 'eva@example.com', password: '1234567'}
]
users.each { |user| User.create(email: user[:email], password: user[:password]) }
puts 'users count is'
puts users.count

puts 'Creating messages'
messages = [
  'Welcome to the chat',
  'What a great chat this is',
  'poo poo',
  'poo poo to you too',
  'I love React',
  'I love React the most in the whole world',
  'I love this channel',
  'I love life',
  'Omg its so windy today'
]
messages.each { |message|
  user_id = rand(1..(users.count))
  message = Message.create(content: message, author: User.find(user_id).email, user_id: user_id, channel_id: rand(1..(channels.count)))
  puts message.id
}
