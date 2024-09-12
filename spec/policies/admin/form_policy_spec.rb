# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FormPolicy do
  let(:user) { create(:user, :admin) }

  describe 'how to handle concrete objects' do
    let(:object_to_check) { Form }

    it { is_expected.to permit_actions [:index] }
    it { is_expected.to forbid_actions [:show, :destroy, :new, :create, :edit, :update] }
  end
end
