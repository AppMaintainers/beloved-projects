require 'rails_helper'

RSpec.describe "Logout workflow", type: :feature do
  let(:user){ FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
    visit "/"
  end

  context "when user is logged in" do
    it "should be able to log out" do
      expect(page).to have_text("Log out")
    end

    it "can log out" do
      click_on("Log out")
      expect(page).to have_text("Signed out successfully.")
    end
  end

end