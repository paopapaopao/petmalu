# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'admin@example.com',
  password: :password,
  confirmed_at: DateTime.now,
  first_name: :admin,
  last_name: :istrator,
  admin: true,
  approved: true
)

juan = User.create(
  email: 'juantamad@example.com',
  password: :password,
  confirmed_at: DateTime.now,
  first_name: :juan,
  last_name: :tamad,
  approved: true
)
pong = User.create(
  email: 'pongpagong@example.com',
  password: :password,
  confirmed_at: DateTime.now,
  first_name: :pong,
  last_name: :pagong,
  approved: true
)

4.times do
  Post.create(
    content: (
      Faker::Lorem.sentences(number: rand(3..9)) +
      Faker::Lorem.questions(number: rand(0..2))
    ).shuffle.join(" "),
    user_id: juan.id
  )
  Comment.create(
    body: (
      Faker::Lorem.sentences(number: rand(2..16)) +
      Faker::Lorem.questions(number: rand(0..4))
    ).shuffle.join(" "),
    user_id: juan.id,
    post_id: Post.last.id
  )
  Comment.create(
    body: (
      Faker::Lorem.sentences(number: rand(2..16)) +
      Faker::Lorem.questions(number: rand(0..4))
    ).shuffle.join(" "),
    user_id: pong.id,
    post_id: Post.last.id
  )

  Post.create(
    content: (
      Faker::Lorem.sentences(number: rand(3..9)) +
      Faker::Lorem.questions(number: rand(0..2))
    ).shuffle.join(" "),
    user_id: juan.id
  )
  Comment.create(
    body: (
      Faker::Lorem.sentences(number: rand(2..16)) +
      Faker::Lorem.questions(number: rand(0..4))
    ).shuffle.join(" "),
    user_id: juan.id,
    post_id: Post.last.id
  )
  Comment.create(
    body: (
      Faker::Lorem.sentences(number: rand(2..16)) +
      Faker::Lorem.questions(number: rand(0..4))
    ).shuffle.join(" "),
    user_id: pong.id,
    post_id: Post.last.id
  )
end
