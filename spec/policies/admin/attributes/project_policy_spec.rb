# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attributes::ProjectPolicy do
  let(:user) { create(:user, :admin) }
  let(:object_to_check) { checked_project }

  describe 'how valid_deactivated_at? works' do
    let(:checked_project) { create(:project) }

    context 'when current_user is admin' do
      it { expect(policy.valid_deactivated_at?(nil)).to be_truthy }
      it { expect(policy.valid_deactivated_at?(1.day.ago)).to be_truthy }
    end
  end
end
