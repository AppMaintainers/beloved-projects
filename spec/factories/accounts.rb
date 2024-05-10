# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name { Faker::Hipster.word }
    description { Faker::Lorem.sentence }
    domain { Faker::Internet.url }
    organization { Faker::Company.name }
    services { Faker::Company.buzzword }

    account_managers { create_list(:user, 1) }
    project
  end
end
