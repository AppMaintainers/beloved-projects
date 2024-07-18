# frozen_string_literal: true

# rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations

RSpec.describe 'Create project' do
  let(:user) { create(:user) }

  before { login_as user }

  context 'with account and link' do
    it 'is successful' do
      visit '/'

      click_on('Create new project')
      fill_in('project[title]', with: 'Test project')
      click_on('Save')
      expect(page).to have_text('Project created successfully!')

      click_on('Test project')
      click_on('New')
      click_on('Account')
      fill_in('account[name]', with: 'Test account')
      fill_in('account[services]', with: 'test')
      select(user.first_name, from: 'account[account_manager_ids][]')
      click_on('Save')
      expect(page).to have_text('Account created successfully!')

      click_on('New')
      click_on('Link')
      fill_in('link[title]', with: 'Test link')
      fill_in('link[url]', with: 'http://test.com')
      click_on('Save')
      expect(page).to have_text('Link created successfully!')
    end
  end
end

# rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations
