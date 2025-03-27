# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forms' do
  describe 'Index' do
    let(:user) { create(:user, :admin) }

    before { login_as user }

    it 'displays successfully' do
      get forms_path

      expect(response).to have_http_status :ok
    end
  end

  describe 'Show' do
    let(:form) { create(:form) }
    let(:params) { {} }

    context 'when mismatching secret' do
      it 'redirects not authorized' do
        get form_path(form), params: params

        expect(response).to redirect_to root_path
      end
    end

    context 'when matching secret' do
      let(:params) { { secret: form.secret } }

      it 'displays successfully' do
        get form_path(form), params: params

        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'Send Form' do
    let(:user) { create(:user, :admin) }
    let(:form) { create(:form) }

    before do
      login_as user
      form.project.maintainers << create(:user)
      form.project.maintainers << create(:user, :admin)
    end

    it 'redirects to forms index' do
      post send_form_form_path(form)

      expect(response).to redirect_to(forms_path)
    end

    it 'sends emails to non admin users' do
      expect { post send_form_form_path(form) }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
