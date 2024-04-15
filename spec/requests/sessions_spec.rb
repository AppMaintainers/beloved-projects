# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'sign in' do
    let(:user) { create(:user) }
    let(:params) { { user: { email: user.email, password: password } } }

    context 'when user credentials are valid' do
      let(:password) { user.password }

      it 'signs in when user is valid' do
        expect(post(user_session_path), params: params).to redirect_to(root_path)
      end
    end

    context 'when user credentials are not valid' do
      let(:password) { 'not valid password' }

      it 'refuses to sign in user' do
        post user_session_path, params: params
        expect(response.body).to include('Invalid Email or password.')
      end
    end
  end
end
