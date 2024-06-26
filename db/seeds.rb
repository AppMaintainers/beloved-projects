# frozen_string_literal: true

require 'database_cleaner/active_record'

DatabaseCleaner[:active_record].strategy = :truncation
DatabaseCleaner[:active_record].clean

basic_user = FactoryBot.create(:user, email: 'basic@example.com')
admin_user = FactoryBot.create(:user, email: 'admin@example.com', admin: true)
FactoryBot.create(:user, email: 'deactivated@example.com', deactivated_at: 2.days.ago)
FactoryBot.create(:user, email: 'auto_gen_pw@example.com', auto_gen_password: true)

complete_project = FactoryBot.create(:project, title: 'Complete Project', maintainers: [basic_user, admin_user])
FactoryBot.create(:project, title: 'Empty Project', maintainers: [admin_user])

FactoryBot.create_list(:account, 4, project: complete_project, account_managers: [basic_user, admin_user])
FactoryBot.create_list(:link, 4, project: complete_project)
