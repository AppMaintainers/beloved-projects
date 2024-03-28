# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Magic Link' do
  describe 'POST' do
    subject(:request) { post magic_link_path, params: params }

    let(:params) { { user: { email: email } } }
    let(:email) { user.email }
    let(:user) { create(:user) }

    it 'sends an email' do
      expect { request }
        .to change { ActionMailer::Base.deliveries }
              .from([])
              .to(contain_exactly(have_attributes(to: [user.email])))
    end

    context 'with invalid email' do
      let(:email) { "not-#{user.email}" }

      it 'does not send email' do
        expect { request }.not_to change { ActionMailer::Base.deliveries }.from([])
      end
    end
  end

  describe 'GET' do
    subject(:request) { get magic_link_path(token: token) }

    let(:token) do
      Rails
        .application.message_verifier('magic_link')
        .generate({ user_id: user_id, last_login: last_login }, purpose: :login, expires_in: 15.minutes)
    end
    let(:user) { create(:user) }
    let(:user_id) { user.id }
    let(:last_login) { user.last_sign_in_at }

    it 'redirects to the home dashboard' do
      expect(request).to redirect_to(root_path)
    end

    context 'with expired token' do
      let(:token_generated_at) { 30.minutes.ago }

      it 'redirects back to the sign in page' do
        travel_to(token_generated_at) do
          token # pre-generated token at the given time
        end

        expect(request).to redirect_to(new_user_session_path)
      end
    end

    context 'with non-existing user' do
      let(:user_id) { user.id + 1 }

      it 'redirects back to the sign in page' do
        expect(request).to redirect_to(new_user_session_path)
      end
    end

    context 'with successful login since the token was created' do
      let(:last_login) { user.last_sign_in_at - 2.minutes }

      it 'redirects back to the sign in page' do
        expect(request).to redirect_to(new_user_session_path)
      end
    end

    context 'without token' do
      let(:token) { '' }

      it 'redirects back to the sign in page' do
        expect(request).to redirect_to(new_user_session_path)
      end
    end

    context 'with an invalid token' do
      let(:token) { 'asdasd' }

      it 'redirects back to the sign in page' do
        expect(request).to redirect_to(new_user_session_path)
      end
    end

    context 'with deactivated user' do
      let(:user) { create(:user, deactivated_at: 2.minutes.ago) }

      it 'redirects back to the sign in page' do
        expect(request).to redirect_to(new_user_session_path)
      end
    end
  end
end
