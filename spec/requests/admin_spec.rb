# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin' do
  let(:admin) { create(:user, :admin) }

  before { login_as admin }

  context 'when user added as admin' do
    let(:target_user) { create(:user) }

    it 'user becomes admin' do
      expect { post user_admin_path(target_user) }.to change { target_user.reload.admin }.from(false).to(true)
    end

    it 'redirects correctly' do
      post user_admin_path(target_user)

      expect(response).to redirect_to(users_path)
    end
  end

  context 'when user removed as admin' do
    it 'user is no longer admin' do
      expect { delete user_admin_path(admin) }.to change { admin.reload.admin }.from(true).to(false)
    end

    it 'redirects correctly' do
      delete user_admin_path(admin)

      expect(response).to redirect_to(users_path)
    end
  end
end
