# frozen_string_literal: true

FactoryBot.define do
  factory :select_question do
    question { Faker::Lorem.sentence }
    order { Faker::Number.between(from: 1, to: 100) }
    options { [Faker::Tea.variety] }

    form
  end
end
