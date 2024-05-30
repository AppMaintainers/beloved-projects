# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkPolicy::Scope do
  let(:user) { create(:user, :admin) }
  let(:class_to_check) { Link }

  let(:project) { create(:project, links: link, deactivated_at: deactivated_at) }
  let(:link) { create(:link) }
  let(:deactivated_at) { nil }

  context 'when the project is active' do
    it { expect(resolved_scope).to contain_exactly(link) }
  end

  context 'when the project is deactivated' do
    let(:deactivated_at) { 1.day.ago }

    it { expect(resolved_scope).to be_empty }
  end
end
