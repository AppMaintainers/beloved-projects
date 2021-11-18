require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do

    before do
      @user = FactoryBot.create(:user, password: "asd")
    end

    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

end
