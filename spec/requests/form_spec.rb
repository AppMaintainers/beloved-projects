# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forms' do
  describe 'Show' do
    let(:form) { create(:form) }
    let(:params) { {} }

    context 'for mismatching secret' do
      it 'redirects not authorized' do
        get form_path(form), params: params

        expect(response).to redirect_to root_path
      end
    end

    context 'for matching secret' do
      let(:params) { { secret: form.secret } }

      it 'displays successfully' do
        get form_path(form), params: params

        expect(response).to have_http_status :ok
      end
    end
  end
end
