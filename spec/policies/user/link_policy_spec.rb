# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkPolicy do
  let(:user) { create(:user) }

  describe 'how to handle concrete objects' do
    let(:object_to_check) { link }
    let(:link) { create(:link, project: project) }

    context 'when the user is not a maintainer in the project' do
      let(:project) { create(:project, deactivated_at: deactivated_at) }
      let(:deactivated_at) { nil }

      context 'when the project is active' do
        it { is_expected.to forbid_actions [:show, :create, :new, :edit, :update, :destroy] }
      end

      context 'when the project is deactivated' do
        let(:deactivated_at) { 1.day.ago }

        it { is_expected.to forbid_actions [:show, :create, :new, :edit, :update, :destroy] }
      end
    end

    context 'when the user is a maintainer in the project' do
      let(:project) { create(:project, maintainers: [user], deactivated_at: deactivated_at) }
      let(:deactivated_at) { nil }

      context 'when the project is active' do
        it { is_expected.to permit_actions [:create, :new, :edit, :update, :destroy] }
        it { is_expected.to forbid_actions [:show] }
      end

      context 'when the project is deactivated' do
        let(:deactivated_at) { 1.day.ago }

        it { is_expected.to forbid_actions [:show, :create, :new, :edit, :update, :destroy] }
      end
    end
  end
end
