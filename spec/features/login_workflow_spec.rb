# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Login workflow" do
  let(:user) { create(:user) }

  before do
    visit "/"
    fill_in("user[email]", with: user.email)
    fill_in("user[password]", with: password)
    click_button("Sign in")
  end

  context "with valid password" do
    let(:password) { user.password }

    it "can login" do
      expect(page).to have_text("Signed in successfully.")
    end
  end

  context "with invalid password" do
    let(:password) { "invalid password" }

    it "can't login" do
      expect(page).to have_text("Invalid Email or password.")
    end
  end
end
