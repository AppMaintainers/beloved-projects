require 'rails_helper'

RSpec.fdescribe User, type: :model do
  context "User model" do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { user: { email: user.email, password: password } } }

    context "when user attributes are valid" do
      let(:password) { user.password }

      it 'should be ok' do
        expect(user).to be_valid
      end
    end

    context "when user password is too short" do
      let(:password){ "12345" }

      it 'should fail' do
        expect(user.valid_password?(params[:user][:password])).to be_falsey
      end
    end

  end
end
