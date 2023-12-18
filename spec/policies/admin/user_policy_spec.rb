# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { create(:user, :admin) }

  describe 'how to handle concrete objects' do
    let(:object_to_check) { User }
    let(:checked_user) { create(:user) }

    it { is_expected.to permit_actions [:new, :create, :edit, :update, :index] }
    it { is_expected.to forbid_actions [:show, :destroy] }
  end
end
