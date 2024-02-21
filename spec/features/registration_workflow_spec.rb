# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Registration workflow" do
  before do
    visit "/auth/sign_in/"
    click_on("Sign up")
    fill_in("user[first_name]", with: Faker::Name.first_name)
    fill_in("user[last_name]", with: Faker::Name.last_name)
    fill_in("user[email]", with: email)
    fill_in("user[password]", with: 'password')
    fill_in("user[password_confirmation]", with: 'password')
  end

  context "with valid credentials" do
    let(:email) { "john@email.com" }

    it 'can register' do
      click_button("Sign up")
      expect(page).to have_text("Welcome! You have signed up successfully.")
    end

    it 'will increase Users count' do
      expect { click_button("Sign up") }.to change { User.count }.by(1)
    end
  end

  context "with duplicated email" do
    let!(:user) { create(:user) }
    let(:email) { user.email }

    it "refuses to register" do
      click_button("Sign up")
      expect(page).to have_text("Email has already been taken")
    end

    it "won't increase Users count" do
      expect { click_button("Sign up") }.not_to(change { User.count })
    end
  end
end
