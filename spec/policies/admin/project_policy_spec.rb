# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectPolicy do
  let(:user) { create(:user, :admin) }

  describe 'how to handle general use cases' do
    let(:object_to_check) { Project }

    it { is_expected.to permit_actions [:new] }
  end

  describe 'how to handle concrete objects' do
    let(:object_to_check) { project }
    let(:project) { create(:project, deactivated_at: deactivated_at) }
    let(:deactivated_at) { nil }

    context 'when the project is active' do
      it { is_expected.to permit_actions [:create, :show, :edit, :update, :destroy] }
    end

    context 'when the project is deactivated' do
      let(:deactivated_at) { 1.day.ago }

      it { is_expected.to permit_actions [:create] }
      it { is_expected.to forbid_actions [:show, :edit, :update, :destroy] }
    end
  end
end
