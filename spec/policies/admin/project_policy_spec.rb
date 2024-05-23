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
    let(:project) { create(:project) }

    it { is_expected.to permit_actions [:create, :show, :edit, :update, :destroy] }
  end
end
