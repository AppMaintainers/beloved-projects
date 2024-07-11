# frozen_string_literal: true

RSpec.describe UserPolicy::Scope do
  let(:user) { create(:user) }
  let(:class_to_check) { User }

  context 'when the user is active' do
    it { expect(resolved_scope).to contain_exactly(user) }
  end
end
