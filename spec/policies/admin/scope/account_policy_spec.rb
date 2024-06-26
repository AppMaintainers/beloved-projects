# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountPolicy::Scope do
  let(:user) { create(:user, :admin) }
  let(:class_to_check) { Account }

  let(:project) { create(:project, accounts: account, deactivated_at: deactivated_at) }
  let(:account) { create(:account) }
  let(:deactivated_at) { nil }

  context 'when the project is active' do
    it { expect(resolved_scope).to contain_exactly(account) }
  end

  context 'when the project is deactivated' do
    let(:deactivated_at) { 1.day.ago }

    it { expect(resolved_scope).to be_empty }
  end
end
