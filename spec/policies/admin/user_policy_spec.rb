# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { create(:user, :admin) }

  describe 'how to handle general use cases' do
    let(:object_to_check) { User }

    it { is_expected.to permit_actions [:show] }
  end

  describe 'how to handle concrete objects' do
    let(:object_to_check) { User }
    let(:checked_user) { create(:user) }

    it { is_expected.to permit_actions [:edit, :index] }
    it { is_expected.to forbid_actions [:new, :create, :update, :destroy] }
  end
end
