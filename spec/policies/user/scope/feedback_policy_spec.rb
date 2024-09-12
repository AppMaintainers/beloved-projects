# frozen_string_literal: true

RSpec.describe FeedbackPolicy::Scope do
  let(:user) { create(:user) }
  let(:class_to_check) { Feedback }
  let(:feedback) { create(:feedback) }

  it { expect(resolved_scope).to be_empty }
end
