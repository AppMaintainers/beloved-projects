# frozen_string_literal: true

RSpec.describe FormPolicy::Scope do
  let(:user) { create(:user) }
  let(:class_to_check) { Form }
  let(:form) { create(:form) }

  it { expect(resolved_scope).to be_empty }
end
