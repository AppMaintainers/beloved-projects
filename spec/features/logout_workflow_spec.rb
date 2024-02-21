# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Logout workflow" do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit "/"
  end

  context "when user is logged in" do
    it "can log out" do
      click_on("Logout")
      expect(page).to have_text("Signed out successfully.")
    end
  end
end
