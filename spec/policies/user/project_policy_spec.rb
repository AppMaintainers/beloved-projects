# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectPolicy do
  let(:user) { create(:user) }

  describe 'how to handle general use cases' do
    let(:object_to_check) { Project }

    it { is_expected.to permit_actions [:new, :index] }
  end

  describe 'how to handle concrete objects' do
    let(:object_to_check) { project }

    context 'when the user is not a maintainer in the project' do
      let(:project) { create(:project) }

      it { is_expected.to forbid_actions [:create, :show, :edit, :update, :destroy] }
    end

    context 'when the user is a maintainer in the project' do
      let(:project) { create(:project, maintainers: [user]) }

      it { is_expected.to permit_actions [:create, :show, :edit, :update] }
      it { is_expected.to forbid_actions [:destroy] }
    end
  end
end
