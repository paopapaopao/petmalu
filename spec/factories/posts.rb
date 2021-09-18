FactoryBot.define do
  factory :post do
    content {
      (
        Faker::Lorem.sentences(number: rand(3..9)) +
        Faker::Lorem.questions(number: rand(0..2))
      ).shuffle.join(" ")
    }
  end
end
