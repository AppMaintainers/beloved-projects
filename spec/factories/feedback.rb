# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    trait :with_answers do
      after :create do |feedback|
        string_question_1 = create :string_question
        string_question_2 = create :string_question
        create :string_answer, feedback: feedback, string_question: string_question_1
        create :string_answer, feedback: feedback, string_question: string_question_2
      end
    end
  end
end
