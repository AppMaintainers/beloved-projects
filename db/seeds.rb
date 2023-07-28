# frozen_string_literal: true

FactoryBot.create_list(:user, 5)
FactoryBot.create_list(:project, 3, maintainers: User.all)
