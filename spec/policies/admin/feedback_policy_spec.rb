# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedbackPolicy do
  let(:user) { create(:user, :admin) }

  describe 'how to handle concrete objects' do
    let(:object_to_check) { Feedback }

    it { is_expected.to permit_actions [:index] }
    it { is_expected.to forbid_actions [:show, :destroy, :new, :create, :edit, :update] }
  end
end
