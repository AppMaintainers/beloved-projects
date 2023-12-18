# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { create(:user) }

  describe 'how to handle concrete objects' do
    let(:object_to_check) { user }

    it { is_expected.to permit_actions [:edit, :update] }
    it { is_expected.to forbid_actions [:show, :new, :create, :destroy, :index] }
  end
end
