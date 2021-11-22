require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "sign in" do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { user: { email: user.email, password: password } } }

    context "when user credentials are valid" do
      let(:password) { user.password }
      it "signs in when user is valid" do
        expect( post user_session_path, params: params ).to redirect_to(root_path)
      end
    end

    context "when user credentials are not valid" do
      let(:password) { "not valid password" }

      it "refuses to sign in user" do
        post user_session_path, params: params
        expect(response.body).to include("Invalid Email or password.")
      end
    end

    it "it redirects when is user not logged in" do

    end
  end

  context "can login when they are not signed in" do

  end

  context "redirected from sign in when they are signed in" do

  end

  context "redirected from sign up when they are signed in" do

  end

  it "works! (now write some real specs)" do
    get sessions_path
    expect(response).to have_http_status(200)
  end
end

