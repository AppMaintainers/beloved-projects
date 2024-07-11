# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountPolicy do
  let(:user) { create(:user, :admin) }

  describe 'how to handle concrete objects' do
    let(:object_to_check) { account }
    let(:account) { create(:account, project: project) }
    let(:project) { create(:project, deactivated_at: deactivated_at) }
    let(:deactivated_at) { nil }

    context 'when project is active' do
      it { is_expected.to permit_actions [:new, :edit, :create, :update, :destroy] }
      it { is_expected.to forbid_actions [:show] }
    end

    context 'when project is deactivated' do
      let(:deactivated_at) { 1.day.ago }

      it { is_expected.to forbid_actions [:show, :new, :edit, :create, :update, :destroy] }
    end
  end
end
