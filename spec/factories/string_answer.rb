# frozen_string_literal: true

FactoryBot.define do
  factory :string_answer do
    answer { Faker::Lorem.sentence }

    feedback
    string_question
  end
end
