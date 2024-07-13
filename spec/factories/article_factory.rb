FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    image_url { Faker::Internet.url }
    html_content { Faker::Lorem.paragraph }
    tags { Faker::Lorem.words }
  end
end
