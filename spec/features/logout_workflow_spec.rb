# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logout workflow' do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
    visit '/'
  end

<<<<<<< HEAD
  context "when user is logged in" do
    it "can log out" do
      click_on("Logout")
      expect(page).to have_text("Signed out successfully.")
=======
  context 'when user is logged in' do
    it 'can log out' do
      click_on('Log out')
      expect(page).to have_text('Signed out successfully.')
>>>>>>> 19d25c5 (StringLiterals: applying  single-quotes)
    end
  end
end
