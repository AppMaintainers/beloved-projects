# frozen_string_literal: true

FactoryBot.define do
  factory :scale_answer do
    answer { Faker::Number.between(from: 1, to: 10) }

    feedback
    scale_question
  end
end
