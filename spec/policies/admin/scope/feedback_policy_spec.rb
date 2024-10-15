# frozen_string_literal: true

RSpec.describe FeedbackPolicy::Scope do
  let(:user) { create(:user, :admin) }
  let(:class_to_check) { Feedback }
  let(:feedback) { create(:feedback) }

  it { expect(resolved_scope).to contain_exactly(feedback) }
end
