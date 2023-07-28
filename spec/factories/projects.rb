# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Faker::Hipster.word }
  end
end
