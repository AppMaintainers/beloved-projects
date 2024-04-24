# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Password change' do
  let(:user) { create(:user) }
  let(:password) { Faker::Internet.password }

  before do
    login_as user
    visit '/auth/edit/'
    fill_in('user[password]', with: password)
    fill_in('user[password_confirmation]', with: password)
  end

  context 'with auto-generated current password' do
    let(:user) { create(:user, auto_gen_password: true) }

    it 'can change the password' do
      click_button('Update')
      expect(page).to have_text('Your account has been updated successfully.')
    end
  end

  context 'with giving the current password' do
    it 'can change the password' do
      fill_in('user[current_password]', with: user.password)
      click_button('Update')
      expect(page).to have_text('Your account has been updated successfully.')
    end
  end

  context 'without giving the current password' do
    it 'can not change the password' do
      click_button('Update')
      expect(page).to have_text('Current password can\'t be blank')
    end
  end
end
