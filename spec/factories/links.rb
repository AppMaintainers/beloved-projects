# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    title { Faker::Hipster.word }
    url { Faker::Internet.url(host: 'example.com') }
    description { Faker::Lorem.sentence }

    project
  end
end
