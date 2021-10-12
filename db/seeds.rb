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

Post.create(
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  user_id: juan.id
)
Comment.create(
  body: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  user_id: juan.id,
  post_id: Post.last.id
)
Comment.create(
  body: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  user_id: pong.id,
  post_id: Post.last.id
)

Post.create(
  content: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
  user_id: juan.id
)
Comment.create(
  body: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
  user_id: juan.id,
  post_id: Post.last.id
)
Comment.create(
  body: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
  user_id: pong.id,
  post_id: Post.last.id
)
