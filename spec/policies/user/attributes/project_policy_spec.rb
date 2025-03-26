# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attributes::ProjectPolicy do
  let(:user) { create(:user) }
  let(:object_to_check) { checked_project }

  describe 'how valid_deactivated_at? works' do
    let(:checked_project) { create(:project) }

    context 'when current_user is not admin' do
      it { expect(policy.valid_deactivated_at?(nil)).to be_falsy }
      it { expect(policy.valid_deactivated_at?(1.day.ago)).to be_falsy }
    end
  end
end
