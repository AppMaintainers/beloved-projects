# frozen_string_literal: true

FactoryBot.define do
  factory :form do
    title { Faker::Book.title }

    project

    trait :with_questions do
      after :create do |form|
        create_list :string_question, 2, form: form
      end
    end
  end
end
