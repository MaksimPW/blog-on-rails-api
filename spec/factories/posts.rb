FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.word }
    content 'content'
    author { Faker::Name.name }
    likes { Faker::Number.between(1, 20) }
    image ''
  end
end
