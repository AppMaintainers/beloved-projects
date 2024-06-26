# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User' do
  let(:admin) { create(:user, :admin) }

  before { login_as admin }

  describe 'New' do
    it 'displays form successfully' do
      get new_user_path

      expect(response).to have_http_status :ok
    end
  end

  describe 'Create' do
    context 'when create is successful' do
      let(:params) { { user: build(:user).attributes } }

      it 'admin creates new user' do
        expect { post users_path, params: params }.to change { User.count }.by(1)
      end

      it 'redirects correctly' do
        post users_path, params: params

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when create fails' do
      let(:params) { {} }

      it 'redirects correctly' do
        post users_path, params: params

        expect(response).to redirect_to(new_user_path)
      end
    end
  end

  describe 'Edit' do
    it 'displays form successfully' do
      get edit_user_path(admin)

      expect(response).to have_http_status :ok
    end
  end

  describe 'Update' do
    context 'when update is successful' do
      let(:params) { { user: admin.attributes.merge(first_name: 'Alan2') } }

      it 'admin creates new user' do
        expect { patch user_path(admin), params: params }.to change { admin.reload.first_name }.to 'Alan2'
      end

      it 'redirects correctly' do
        patch user_path(admin), params: params

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when create fails' do
      let(:params) { { user: admin.attributes.merge(email: '') } }

      it 'redirects correctly' do
        patch user_path(admin), params: params

        expect(response).to redirect_to(edit_user_path(admin))
      end
    end
  end
end
