# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attributes::UserPolicy do
  let(:user) { create(:user, :admin) }
  let(:object_to_check) { checked_user }

  describe 'how valid_admin? works' do
    let(:checked_user) { create(:user, admin: admin) }

    context 'when the checked user is not admin' do
      let(:admin) { false }

      it { expect(policy.valid_admin?(true)).to be_truthy }
      it { expect(policy.valid_admin?(false)).to be_falsey }
    end

    context 'when the checked user is admin' do
      let(:admin) { true }

      it { expect(policy.valid_admin?(true)).to be_falsey }
      it { expect(policy.valid_admin?(false)).to be_falsey }
    end

    context 'when the checked user is checking user' do
      let(:checked_user) { user }

      it { expect(policy.valid_admin?(true)).to be_falsey }
      it { expect(policy.valid_admin?(false)).to be_truthy }
    end
  end
end
