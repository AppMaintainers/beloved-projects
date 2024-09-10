# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    trait :with_answers do
      after :create do |feedback|
        2.times do
          create(:string_question)
            .then { create(:string_answer, feedback: feedback, string_question: _1) }
        end
      end
    end
  end
end
