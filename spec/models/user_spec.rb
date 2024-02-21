# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe "User model" do
    let(:user) { create(:user) }

    context "when user attributes are valid" do
      it 'passes' do
        expect(user).to be_valid
      end
    end

    context "when user password is too short" do
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
    end

    context "when email address is valid" do
      it 'passes' do
        is_expected.to allow_value('user@example.com',
                                   'USER@foo.COM',
                                   'A_US-ER@foo.bar.org',
                                   'first.last@foo.jp',
                                   'alice+bob@baz.cn').for(:email)
      end
    end

    context "when email address is not valid" do
      it { is_expected.not_to allow_value('user@@example.com').for(:email) }
    end
  end
end
