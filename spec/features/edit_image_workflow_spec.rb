require 'rails_helper'

RSpec.fdescribe "Edit avatar workflow", type: :feature do
  let(:user){ FactoryBot.create(:user) }
  before do
    login_as(user)
    visit edit_user_registration_path
  end

  context "when editing profile image" do
    it "it changes avatar" do
      within("")
    end
  end

end

