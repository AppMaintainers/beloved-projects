# frozen_string_literal: true

FactoryBot.define do
  factory :form do
    title { Faker::Book.title }

    project
  end
end
