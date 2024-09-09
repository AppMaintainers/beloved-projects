# frozen_string_literal: true

FactoryBot.define do
  factory :text_question do
    question { Faker::Lorem.sentence }
    order { Faker::Number.between(from: 1, to: 100) }

    form
  end
end
