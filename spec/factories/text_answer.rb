# frozen_string_literal: true

FactoryBot.define do
  factory :text_answer do
    answer { Faker::Lorem.sentence }

    feedback
    text_question
  end
end
