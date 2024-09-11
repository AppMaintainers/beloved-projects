# frozen_string_literal: true

FactoryBot.define do
  factory :scale_answer do
    answer { (scale_question.minimum..scale_question.maximum).to_a.sample }

    feedback
    scale_question
  end
end
