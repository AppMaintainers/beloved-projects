require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User model" do
    let(:user) { FactoryBot.create(:user) }

    context "when user attributes are valid" do
      it 'should pass' do
        expect(user).to be_valid
      end
    end

    context "when user password is too short" do
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
    end

    context "when email address is valid" do
      it { is_expected.to allow_value('user@example.com',
                              'USER@foo.COM',
                              'A_US-ER@foo.bar.org',
                              'first.last@foo.jp',
                              'alice+bob@baz.cn').for(:email) }
    end

    context "when email address is not valid" do
      it { is_expected.not_to allow_value('user@@example.com').for(:email) }
    end

    context "when an email is already in use" do
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end
  end
end
