# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectPolicy::Scope do
  let(:user) { create(:user, :admin) }
  let(:class_to_check) { Project }

  context 'when there are no project' do
    it { expect(resolved_scope).to be_empty }
  end

  context 'when there are some projects' do
    let!(:project) { create(:project, deactivated_at: deactivated_at) }
    let(:deactivated_at) { nil }

    it { expect(resolved_scope).to contain_exactly(project) }

    context 'when the project is deactivated' do
      let(:deactivated_at) { 1.day.ago }

      it { expect(resolved_scope).to be_empty }
      it { expect(Project.count).to equal 1 }
    end
  end
end
