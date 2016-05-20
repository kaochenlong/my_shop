FactoryGirl.define do
  factory :product do
    title Faker::Name.title
    description Faker::Lorem.paragraph
    price Faker::Number.between(10, 1000)

    trait :ruby_book do
      title "Ruby Book"
      price 100
    end

    trait :php_book do
      title "PHP Book"
      price 1000
    end
  end
end
