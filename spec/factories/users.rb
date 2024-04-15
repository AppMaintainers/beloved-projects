# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at { DateTime.now }

    trait :admin do
      admin { true }
    end

    trait :signed_in do
      # MagicLink manages this field.
      # MagicLink doesn't register time shorter than a millionth of a second.
      last_sign_in_at { 1.day.ago.change(usec: 0) }
    end
  end
end
