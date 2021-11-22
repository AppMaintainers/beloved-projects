require 'rails_helper'

RSpec.describe "Login workflow", type: :feature do
  let(:user){FactoryBot.create(:user)}
  before do
    visit "/"
    click_on("Log in")
    fill_in("user[email]", with: user.email)
    fill_in("user[password]", with: password)
    click_button("Sign in")
  end

  context "with valid password" do
    let(:password){user.password}

    it "can login" do
      expect(page).to have_text("Üdv, #{user.first_name}!")
    end
  end

  context "with invalid password" do
    let(:password){"invalid password"}

    it "can't login" do
      expect(page).to have_text("Invalid Email or password.")
    end
  end

end

