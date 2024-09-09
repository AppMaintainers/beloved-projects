# frozen_string_literal: true

FactoryBot.define do
  factory :select_answer do
    answer { select_question.options.sample }

    select_question
    feedback
  end
end
