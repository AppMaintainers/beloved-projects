# frozen_string_literal: true

basic_user = FactoryBot.create(:user, email: 'basic@example.com')
admin_user = FactoryBot.create(:user, email: 'admin@example.com', admin: true)
FactoryBot.create(:user, email: 'deactivated@example.com', deactivated_at: DateTime.days_ago(2))
FactoryBot.create(:user, email: 'auto_gen_pw@example.com', auto_gen_password: true)

project_everything = FactoryBot.create(:project, title: 'Everything Project', maintainers: [basic_user, admin_user])
FactoryBot.create(:project, title: 'Empty Project', maintainers: admin_user)

FactoryBot.create_list(:account, 4, project: project_everything, account_managers: [basic_user, admin_user])
FactoryBot.create_list(:link, 4, project_id: project_everything)
