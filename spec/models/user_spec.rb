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
      let(:password){ "12345" }

      it 'should not pass' do
        expect(user).not_to be_valid_password(password)
      end
    end

    context "when email address is valid" do
      let(:valid_addresses){ %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn] }

      it 'should pass' do
        valid_addresses.each do |address|
          user.email = address
          expect(user).to be_valid
        end
      end
    end

    context "when email address is not valid" do
      let(:invalid_addresses){ %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com] }

      it 'should reject' do
        invalid_addresses.each do |address|
          user.email = address
          expect(user).not_to be_valid
        end
      end
    end

    context "when an email is already in use" do
      let(:duplicate_user){ FactoryBot.build(:user, email: user.email) }

      it 'should be rejected' do
        expect(duplicate_user).not_to be_valid
      end
    end
  end
end
