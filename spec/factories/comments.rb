FactoryBot.define do
  factory :comment do
    body {
      (
        Faker::Lorem.sentences(number: rand(2..16)) +
        Faker::Lorem.questions(number: rand(0..4))
      ).shuffle.join(" ")
    }

    post
  end
end
