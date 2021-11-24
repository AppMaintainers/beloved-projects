require 'rails_helper'

RSpec.fdescribe "Registration workflow", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit "/users/sign_in/"
    click_on("Sign up")
    fill_in("user[first_name]", with: user.first_name)
    fill_in("user[last_name]", with: user.last_name)
    fill_in("user[email]", with: email)
    fill_in("user[password]", with: password)
    fill_in("user[password_confirmation]", with: password_confirmation)
    click_button("Sign up")
  end

  context "with valid credentials" do
    let(:email) { "john@email.com" }
    let(:password) { "password" }
    let(:password_confirmation) { "password" }

    it 'can register' do
      expect(page).to have_text("Welcome! You have signed up successfully.")
    end

    it 'users count will be increased' do
      expect { User.create(
        first_name: user.first_name,
        last_name: user.last_name,
        email: "john.doe@example.com",
        password: password,
        password_confirmation: password
      ) }.to change { User.count }.by(1)
    end
  end

  context "with duplicated email" do
    let(:email) { user.email }
    let(:password) { "password" }
    let(:password_confirmation) { "password" }

    it "refuses to register" do
      expect(page).to have_text("Email has already been taken")
    end
  end

end