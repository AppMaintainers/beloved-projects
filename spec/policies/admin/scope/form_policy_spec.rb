# frozen_string_literal: true

RSpec.describe FormPolicy::Scope do
  let(:user) { create(:user, :admin) }
  let(:class_to_check) { Form }
  let(:form) { create(:form) }

  it { expect(resolved_scope).to contain_exactly(form) }
end
