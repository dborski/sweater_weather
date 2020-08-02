require 'securerandom'

FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    password { Faker::Internet.password }
    api_key { SecureRandom.uuid }
  end
end