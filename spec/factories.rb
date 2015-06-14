FactoryGirl.define do
  factory :oauth_application do
    name          Faker::Company.name
    secret        Faker::Lorem.characters(60)
    redirect_uri  Faker::Internet.url
  end
end